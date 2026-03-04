import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/home/home_cubit.dart';
import 'package:testabd/features/home/home_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';
import '../../core/theme/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeCubit>()..getQuestions()),
      ],
      child: _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final ScrollController _scrollController;
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_shouldLoadNextPage()) {
      context.read<HomeCubit>().getQuestionsByPage();
    }
  }

  bool _shouldLoadNextPage() {
    final state = context.read<HomeCubit>().state;
    if (state.followedQuizStata.isLoading ||
        state.followedQuizStata.isLastPage ||
        state.followedQuizStata.isLoadMore) {
      return false;
    }
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= _scrollThreshold;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: context.read<HomeCubit>().refresh,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            /// Appbar
            SliverAppBar(
              floating: true,
              pinned: true,
              title: Text('TestAbd'),
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () => context.push(AppRouter.leaderboard),
                  icon: Icon(Icons.leaderboard_rounded),
                ),
                IconButton(
                  onPressed: () => context.push(AppRouter.notifications),
                  icon: Icon(Icons.notifications_rounded),
                ),
              ],
            ),

            /// Stories Section
            // StoriesWidget(),

            /// Posts Section
            PostsWidget(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     POSTS WIDGET
// ─────────────────────────────────────────────────────────────
class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // global loading
        if (state.followedQuizStata.isLoading) {
          return SliverFillRemaining(child: Center(child: ProgressView()));
        }

        // loaded list
        final questions = state.followedQuizStata.questions;
        return SliverMainAxisGroup(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final quiz = questions[index];
                return QuestionCard(quiz: quiz);
              }, childCount: questions.length),
            ),

            // pagination loading
            if (state.followedQuizStata.isLoadMore)
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewPadding.bottom + 16,
                  ),
                  height: 56,
                  child: ProgressView(),
                ),
              ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     QUESTION ITEM CARD
// ─────────────────────────────────────────────────────────────
class QuestionCard extends StatelessWidget {
  final QuestionModel quiz;

  const QuestionCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      color: Theme.of(context).colorScheme.surface,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),

        // ← Clips EVERYTHING (image + content + bottom)
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            children: [
              // Background Image (now perfectly rounded thanks to outer ClipRRect)
              CachedNetworkImage(
                imageUrl: quiz.roundImage ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.black87),
                errorWidget: (context, url, error) => Container(
                  color: Colors.black54,
                  child: const Icon(
                    Icons.broken_image_rounded,
                    color: Colors.white38,
                    size: 48,
                  ),
                ),
              ),

              // Gradient Overlay (keeps text readable)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xB3000000), // 70% black top
                      Color(0xE6000000), // 90% black
                      Color(0xFF0A0A0A), // near black bottom
                    ],
                    stops: [0.1, 0.65, 1.0],
                  ),
                ),
              ),

              // Header + Question + Answers
              Column(
                children: [
                  _ModernHeader(
                    quiz: quiz,
                    onNavigateToProfile: () => context.push(
                      AppRouter.userProfileWithUsername(quiz.user?.username),
                    ),
                  ),

                  // Question + Answers
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            quiz.questionText ?? '',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                  letterSpacing: -0.3,
                                ),
                          ),
                          const SizedBox(height: 12),
                          _AnswersList(
                            questionId: quiz.id,
                            answers: quiz.answers,
                            questionType: quiz.questionType,
                            myAnswersId: quiz.myAnswersId,
                            isCompleted: quiz.isCompleted,
                            isLoading: quiz.isLoading,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // === Bottom Bar (also clipped to 32px corners) ===
                  _ModernBottomBar(quiz: quiz),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== MODERN HEADER ====================
class _ModernHeader extends StatelessWidget {
  final QuestionModel quiz;
  final VoidCallback onNavigateToProfile;

  const _ModernHeader({required this.quiz, required this.onNavigateToProfile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onNavigateToProfile,
              child: Row(
                children: [
                  _HeaderUserImage(
                    imageUrl: quiz.user?.profileImage,
                    username: quiz.user?.username ?? '',
                    size: 48,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize(quiz.user?.username ?? ''),
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formatDate(quiz.createdAt),
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (!(quiz.user?.isFollowing ?? false))
            OutlinedButton(
              onPressed: () =>
                  context.read<HomeCubit>().followUser(quiz.id, quiz.user?.id),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white70, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
              ),
              child: quiz.user?.isFollowInLoading ?? false
                  ? ProgressView(color: Colors.white)
                  : Text(
                      context.l10n.follow,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
            ),
        ],
      ),
    );
  }
}

class _HeaderUserImage extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final double size;
  final double borderWidth;
  final Color borderColor;

  const _HeaderUserImage({
    this.imageUrl,
    required this.username,
    this.size = 50.0,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
      child: ClipOval(
        child: CachedNetworkImage(
          width: 36,
          height: 36,
          imageUrl: imageUrl ?? '',
          fit: BoxFit.cover,
          placeholder: (_, __) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
          errorWidget: (_, __, ___) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// ==================== MODERN BOTTOM BAR ====================
class _ModernBottomBar extends StatelessWidget {
  final QuestionModel quiz;

  const _ModernBottomBar({required this.quiz});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<HomeCubit>();
    return Container(
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats + actions row
          Row(
            children: [
              if (quiz.correctCount != null)
                _StatItem(
                  icon: Icons.check_circle,
                  color: Colors.green,
                  count: quiz.correctCount.toString(),
                ),
              const SizedBox(width: 24),
              if (quiz.wrongCount != null)
                _StatItem(
                  icon: Icons.cancel,
                  color: Colors.red,
                  count: quiz.wrongCount.toString(),
                ),
              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share_rounded,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              IconButton(
                onPressed: () => cubit.toggleBookmark(quiz.id),
                icon: quiz.isBookmarkLoading
                    ? const ProgressView()
                    : Icon(
                        quiz.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: quiz.isBookmarked
                            ? Colors.amber
                            : Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Title & description
          Text(
            quiz.testTitle ?? '',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (quiz.testDescription?.isNotEmpty == true)
            Text(
              quiz.testDescription!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String count;

  const _StatItem({
    required this.icon,
    required this.color,
    required this.count,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: color, size: 20),
      const SizedBox(width: 6),
      Text(
        count,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ],
  );
}

// ====================== _AnswersList ANSWER TILE ======================
class _AnswersList extends StatelessWidget {
  final int? questionId;
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final QuestionType? questionType;
  final bool isCompleted;
  final bool isLoading;

  const _AnswersList({
    super.key,
    required this.questionId,
    required this.answers,
    required this.myAnswersId,
    required this.questionType,
    required this.isCompleted,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    switch (questionType) {
      case QuestionType.multipleSelect:
        return MultipleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onItemTap: (answerId) =>
              cubit.setMultipleAnswer(questionId!, answerId),
          onSubmitTap: (answerIds) =>
              cubit.submitAnswer(questionId!, answerIds),
        );

      case QuestionType.singleSelect:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (answerId) =>
              cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );

      case QuestionType.trueFalse:
        return TrueFalseAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (answerId) =>
              cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );

      // TODO: Beautiful text input card later
      case QuestionType.textQuestion:
        return const Center(
          child: Text(
            "Text answer coming soon...",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        );

      default:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (answerId) =>
              cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );
    }
  }
}

// ====================== SHARED GLASS ANSWER TILE ======================
class _GlassAnswerTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isCompleted;
  final bool isLoading;
  final VoidCallback? onTap;
  final bool showCheckbox;

  const _GlassAnswerTile({
    super.key,
    required this.letter,
    required this.text,
    this.isSelected = false,
    this.isCorrect = false,
    this.isCompleted = false,
    this.isLoading = false,
    this.onTap,
    this.showCheckbox = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isCompleted
        ? (isSelected
              ? (isCorrect ? Colors.green : Colors.red)
              : (isCorrect
                    ? Colors.green.withOpacity(0.7)
                    : Colors.white.withOpacity(0.3)))
        : (isSelected ? Colors.greenAccent : Colors.white.withOpacity(0.35));

    final bgOpacity = isCompleted
        ? (isSelected ? 0.20 : (isCorrect ? 0.12 : 0.085))
        : (isSelected ? 0.16 : 0.085);

    return GestureDetector(
      onTap: isCompleted ? null : onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: borderColor,
                width: isSelected || (isCompleted && isCorrect) ? 2.8 : 1.6,
              ),
              color: Colors.white.withOpacity(bgOpacity),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Letter Badge
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.12),
                    border: Border.all(
                      color: borderColor.withOpacity(0.7),
                      width: 2.2,
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 40,
                          height: 40,
                          child: ProgressView(color: Colors.white),
                        )
                      : Center(
                          child: Text(
                            letter,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                ),

                const SizedBox(width: 18),

                // Answer Text
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: isSelected || (isCompleted && isCorrect)
                          ? FontWeight.w700
                          : FontWeight.w500,
                      height: 1.35,
                    ),
                  ),
                ),

                // Right indicator
                if (showCheckbox && !isCompleted)
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => onTap?.call(),
                    activeColor: Colors.green,
                    checkColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    side: const BorderSide(color: Colors.white70, width: 1.5),
                  )
                else if (isCompleted)
                  Icon(
                    isSelected || isCorrect
                        ? (isCorrect
                              ? Icons.check_circle_rounded
                              : Icons.cancel_rounded)
                        : null,
                    color: isCorrect ? Colors.green : Colors.red,
                    size: 32,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ====================== MULTIPLE SELECT ======================
class MultipleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int answerId) onItemTap;
  final void Function(Set<int> answers) onSubmitTap;

  const MultipleAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.isLoading,
    required this.onItemTap,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...answers.asMap().entries.map((entry) {
          final index = entry.key;
          final answer = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _GlassAnswerTile(
              letter: String.fromCharCode(65 + index),
              text: answer.answerText ?? '',
              isSelected: myAnswersId.contains(answer.id),
              isCorrect: answer.isCorrect,
              isCompleted: isCompleted,
              onTap: () => onItemTap(answer.id!),
              showCheckbox: true,
            ),
          );
        }),

        if (!isCompleted)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: myAnswersId.isNotEmpty && !isLoading
                    ? () => onSubmitTap(myAnswersId)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: isLoading
                    ? const ProgressView()
                    : const Text("Submit Answers"),
              ),
            ),
          ),
      ],
    );
  }
}

// ====================== SINGLE SELECT ======================
class SingleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int? answerId) onSubmitTap;

  const SingleAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.onSubmitTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers.asMap().entries.map((entry) {
        final index = entry.key;
        final answer = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _GlassAnswerTile(
            letter: String.fromCharCode(65 + index),
            text: answer.answerText ?? '',
            isSelected: myAnswersId.contains(answer.id),
            isCorrect: answer.isCorrect,
            isLoading: answer.isLoading,
            isCompleted: isCompleted,
            onTap: () => onSubmitTap(answer.id),
          ),
        );
      }).toList(),
    );
  }
}

// ====================== TRUE / FALSE ======================
class TrueFalseAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int? answerId) onSubmitTap;

  const TrueFalseAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.onSubmitTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: answers.asMap().entries.map((entry) {
        final index = entry.key;
        final answer = entry.value;

        return Expanded(
          child: _GlassAnswerTile(
            letter: index == 0 ? "✓" : "✕",
            text: answer.answerText ?? (index == 0 ? "True" : "False"),
            isSelected: myAnswersId.contains(answer.id),
            isCorrect: answer.isCorrect,
            isCompleted: isCompleted,
            onTap: () => onSubmitTap(answer.id),
          ),
        );
      }).toList(),
    );
  }
}
