import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/bookmark_questions_cubit.dart';
import 'package:testabd/features/profile/bookmark_questions_state.dart';
import 'package:testabd/router/app_router.dart';

class BookmarkQuestionsScreen extends StatelessWidget {
  const BookmarkQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BookmarkQuestionsCubit>()..getQuestions(),
      child: const _View(),
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

  static const double _scrollThreshold = 300.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_shouldLoadMore()) {
      context.read<BookmarkQuestionsCubit>().getQuestionsByPage();
    }
  }

  bool _shouldLoadMore() {
    if (!_scrollController.hasClients) return false;
    final cubit = context.read<BookmarkQuestionsCubit>();
    if (cubit.state.isLoadingMore) return false; // prevent duplicate calls

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= _scrollThreshold;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saqlangan savollar')),
      body: BlocBuilder<BookmarkQuestionsCubit, BookmarkQuestionsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: ProgressView.medium());
          }

          if (state.questions.isEmpty && !state.isLoadingMore) {
            return const _EmptyState();
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              _QuestionsList(state: state),
              if (state.isLoadingMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: ProgressView.small()),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bookmark_border_rounded,
            size: 80,
            color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
          ),
          const SizedBox(height: 24),
          Text(
            "Hozircha saqlangan savollar yo‘q",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Savollarni saqlash uchun bookmark belgisini bosing",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _QuestionsList extends StatelessWidget {
  final BookmarkQuestionsState state;

  const _QuestionsList({required this.state});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: state.questions.length,
        itemBuilder: (context, index) {
          final question = state.questions[index];
          return _QuestionCard(
            question: question,
            isFirst: index == 0,
            onTap: () {
              final id = question.id;
              if (id != null) {
                context.push(AppRouter.userQuestionDetailWithBlockId(id));
              }
            },
          );
        },
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final VoidCallback onTap;
  final bool isFirst;

  const _QuestionCard({
    required this.question,
    required this.onTap,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final difficulty =
        question.difficultyPercentage?.toDifficulty() ?? Difficulty.easy;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: isFirst ? 16 : 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row
            Row(
              children: [
                _DifficultyBadge(difficulty: difficulty),
                const Spacer(),
                if (question.createdAt != null)
                  Text(
                    formatDate(question.createdAt!),
                    style: TextStyle(
                      fontSize: 13.5,
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Question
            Text(
              question.questionText ?? 'Savol matni mavjud emas',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                height: 1.38,
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),

            const SizedBox(height: 20),

            // Stats + action
            Row(
              children: [
                if (question.correctCount != null ||
                    question.wrongCount != null) ...[
                  _StatItem(
                    icon: Icons.check_circle_rounded,
                    color: Colors.green,
                    value: question.correctCount ?? 0,
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    icon: Icons.cancel_rounded,
                    color: Colors.redAccent,
                    value: question.wrongCount ?? 0,
                  ),
                ],
                const Spacer(),
                _ViewButton(onTap: onTap),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int value;

  const _StatItem({
    required this.icon,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 6),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _ViewButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ViewButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.primary.withOpacity(0.12),
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ko‘rish",
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: scheme.primary,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: scheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  final Difficulty difficulty;

  const _DifficultyBadge({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: difficulty.color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: difficulty.color.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Text(
        difficulty.name.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
          color: difficulty.color,
        ),
      ),
    );
  }
}
