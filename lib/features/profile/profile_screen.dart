import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/enums/knowledge_level_enum.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/profile_cubit.dart';
import 'package:testabd/features/profile/profile_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<ProfileCubit>(),
    child: const _View(),
  );
}

enum PageType { questions, block, books }

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  PageType _currentPage = PageType.questions;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }

    // Infinite scroll
    if (_shouldLoadNextPage()) {
      final cubit = context.read<ProfileCubit>();
      if (_currentPage == PageType.questions) cubit.getQuestionsByPage();
      if (_currentPage == PageType.block) cubit.getBlockByPage();
      if (_currentPage == PageType.books) cubit.getReadingSessionsByPage();
    }
  }

  bool _shouldLoadNextPage() {
    final state = context.read<ProfileCubit>().state;
    if (state.isLoading) return false;
    if (!_scrollController.hasClients) return false;

    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;
    return max - current <= 300;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _getAppBarBackground(),
            elevation: _scrollOffset > 80 ? 4 : 0,
            foregroundColor: _scrollOffset > 120
                ? scheme.onSurface
                : Colors.white,
            title: Text(
              "@${state.myInfoModel?.username ?? ''}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: context.read<ProfileCubit>().refresh,
            child: state.isLoading && state.myInfoModel == null
                ? const ProgressView()
                : CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      // ── PREMIUM PROFILE HEADER ──
                      SliverToBoxAdapter(
                        child: _PremiumHeader(
                          imageUrl: state.myInfoModel?.profileImage ?? '',
                          level:
                              state.myInfoModel?.level ?? KnowledgeLevel.none,
                          fullName: state.myInfoModel?.fullName ?? '',
                          bio: state.myInfoModel?.bio ?? '',
                          followers: state
                              .userConnectionsState
                              .connections
                              .followers
                              .length
                              .toString(),
                          following: state
                              .userConnectionsState
                              .connections
                              .following
                              .length
                              .toString(),
                          onEdit: () => context.push(AppRouter.editProfile),
                          onBookmarkNavigate: () =>
                              context.push(AppRouter.bookmarkQuestions),
                          onFollowers: () => context.push(
                            AppRouter.profileConnectionWithUserId(
                              connectionType: ConnectionsEnum.followers.name,
                            ),
                          ),
                          onFollowing: () => context.push(
                            AppRouter.profileConnectionWithUserId(
                              connectionType: ConnectionsEnum.following.name,
                            ),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // ── STATISTICS ──
                      _Statistics(
                        coins: state.myInfoModel?.coins?.toString() ?? "0",
                        correct: "12",
                        wrong: state.myInfoModel?.wrongCount?.toString() ?? "0",
                        accuracy:
                            state.myInfoModel?.findAccuracy().toString() ?? "0",
                        accuracyPer: state.myInfoModel?.findAccuracy() ?? 0,
                        onBookmark: () =>
                            context.push(AppRouter.bookmarkQuestions),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // ── MODERN TABS ──
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _ModernTabDelegate(
                          TabBar(
                            controller: _tabController,
                            onTap: (index) => setState(
                              () => _currentPage = PageType.values[index],
                            ),
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                            labelColor: scheme.onSurface,
                            unselectedLabelColor: scheme.onSurface.withOpacity(
                              0.6,
                            ),
                            indicatorColor: scheme.primary,
                            indicatorWeight: 2,
                            tabs: [
                              Tab(text: context.l10n.questions),
                              Tab(text: context.l10n.blockTest),
                              Tab(text: context.l10n.books),
                            ],
                          ),
                        ),
                      ),

                      // ── DYNAMIC CONTENT ──
                      if (_currentPage == PageType.block)
                        _BlocksSection(state: state.blocksState),
                      if (_currentPage == PageType.questions)
                        _QuestionsSection(state: state.questionsState),
                      if (_currentPage == PageType.books)
                        _BooksSection(state: state.readingSessionsState),
                    ],
                  ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (_currentPage == PageType.questions) {
                context.push(AppRouter.createQuestions);
              } else if (_currentPage == PageType.block) {
                context.push(AppRouter.createBlock);
              }
            },
            label: Text(
              _currentPage == PageType.questions ? "Yangi savol" : "Yangi blok",
            ),
            icon: const Icon(Icons.add_rounded),
            backgroundColor: scheme.primary,
            foregroundColor: scheme.onPrimary,
          ),
        );
      },
    );
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM HEADER
// ─────────────────────────────────────────────────────────────
class _PremiumHeader extends StatelessWidget {
  final String imageUrl;
  final KnowledgeLevel level;
  final String fullName;
  final String bio;
  final String followers;
  final String following;
  final VoidCallback onEdit;
  final VoidCallback onBookmarkNavigate;
  final VoidCallback onFollowers;
  final VoidCallback onFollowing;

  const _PremiumHeader({
    required this.imageUrl,
    required this.level,
    required this.fullName,
    required this.bio,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onBookmarkNavigate,
    required this.onFollowers,
    required this.onFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 120, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Avatar with gradient ring + level badge
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 132,
                height: 132,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Image.asset(
                        AppImages.defaultAvatar,
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (_, __, ___) => Image.asset(
                        AppImages.defaultAvatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    level.getText(context),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            fullName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),
          Text(
            bio.isEmpty ? "Bio mavjud emas" : bio,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.85),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 24),

          // Followers / Following
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CountPill(
                title: context.l10n.followers,
                value: followers,
                onTap: onFollowers,
              ),
              const SizedBox(width: 32),
              _CountPill(
                title: context.l10n.following,
                value: following,
                onTap: onFollowing,
              ),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onEdit,
              icon: const Icon(Icons.edit_rounded, color: Colors.white),
              label: Text(
                context.l10n.editProfile,
                style: const TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onBookmarkNavigate,
              icon: const Icon(Icons.bookmark_rounded, color: Colors.white),
              label: Text(
                context.l10n.bookmarkedQuestions,
                style: const TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CountPill extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const _CountPill({
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     STATISTICS (modern cards)
// ─────────────────────────────────────────────────────────────
class _Statistics extends StatelessWidget {
  final String coins;
  final String correct;
  final String wrong;
  final String accuracy;
  final double accuracyPer;
  final VoidCallback onBookmark;

  const _Statistics({
    required this.coins,
    required this.correct,
    required this.wrong,
    required this.accuracy,
    required this.accuracyPer,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildListDelegate([
          _StatCard(
            title: context.l10n.totalTests,
            value: coins,
            icon: Icons.monetization_on_rounded,
            color: Colors.orange,
          ),
          _StatCard(
            title: context.l10n.correctAnswers,
            value: correct,
            icon: Icons.check_circle_rounded,
            color: Colors.green,
          ),
          _StatCard(
            title: context.l10n.wrongAnswers,
            value: wrong,
            icon: Icons.cancel_rounded,
            color: Colors.red,
          ),
          _StatCard(
            title: context.l10n.accuracy,
            value: "$accuracy%",
            icon: Icons.leaderboard_rounded,
            color: Colors.blue,
            progress: accuracyPer / 100,
          ),
        ]),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double? progress;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          if (progress != null)
            LinearProgressIndicator(
              value: progress,
              backgroundColor: scheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation(color),
              borderRadius: BorderRadius.circular(6),
              minHeight: 6,
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     MODERN TABS DELEGATE
// ─────────────────────────────────────────────────────────────
class _ModernTabDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _ModernTabDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height + 8;

  @override
  double get maxExtent => tabBar.preferredSize.height + 8;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(top: 8),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

// ─────────────────────────────────────────────────────────────
//                     BLOCKS SECTION
// ─────────────────────────────────────────────────────────────
class _BlocksSection extends StatelessWidget {
  final BlocksState state;

  const _BlocksSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const SliverToBoxAdapter(child: Center(child: ProgressView()));
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 7 / 8,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final block = state.blocks[index];
          return _ModernBlockCard(
            title: block.title ?? '',
            description: block.description ?? '',
            onTap: () =>
                context.push(AppRouter.blockDetailWithBlockId(block.id ?? -1)),
          );
        }, childCount: state.blocks.length),
      ),
    );
  }
}

class _ModernBlockCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ModernBlockCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: subtle icon + title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: scheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.library_books_rounded,
                    color: scheme.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Description
            Expanded(
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Bottom "View" pill with arrow
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: scheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ko‘rish",
                      style: TextStyle(
                        fontSize: 12.5,
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
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     QUESTIONS SECTIONS
// ─────────────────────────────────────────────────────────────
class _QuestionsSection extends StatelessWidget {
  final QuestionsState state;

  const _QuestionsSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const SliverToBoxAdapter(child: ProgressView());

    return SliverMainAxisGroup(
      slivers: [
        SliverList.separated(
          itemCount: state.questions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            final q = state.questions[index];
            return _QuestionCard(
              question: q,
              submitAnswer: (answerIds) =>
                  context.read<ProfileCubit>().submitAnswer(answerIds),
              setMultipleAnswer: (answerId) =>
                  context.read<ProfileCubit>().setMultipleAnswer(answerId),
              toggleBookmark: () =>
                  context.read<ProfileCubit>().toggleBookmark(q.id),
            );
          },
        ),

        if (state.isLoadingMore)
          const SliverToBoxAdapter(
            child: SizedBox(width: 40, height: 40, child: ProgressView()),
          ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final QuestionModel? question;
  final void Function(Set<int> answers) submitAnswer;
  final void Function(int? answerId) setMultipleAnswer;
  final VoidCallback toggleBookmark;

  const _QuestionCard({
    super.key,
    required this.question,
    required this.submitAnswer,
    required this.setMultipleAnswer,
    required this.toggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),

        // ← Clips EVERYTHING (image + content + bottom)
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            children: [
              // Background Image (now perfectly rounded thanks to outer ClipRRect)
              CachedNetworkImage(
                imageUrl: question?.roundImage ?? '',
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
                    quiz: question,
                    onNavigateToProfile: () => context.push(
                      AppRouter.userProfileWithUsername(
                        question?.user?.username,
                      ),
                    ),
                    onFollowBtn: () => context.read<ProfileCubit>().onFollow(
                      question?.user?.id,
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
                            question?.questionText ?? '',
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
                            questionId: question?.id,
                            answers: question?.answers ?? [],
                            questionType: question?.questionType,
                            myAnswersId: question?.myAnswersId ?? {},
                            isCompleted: question?.isCompleted ?? false,
                            isLoading: question?.isLoading ?? false,
                            setMultipleAnswer: setMultipleAnswer,
                            submitAnswer: submitAnswer,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // === Bottom Bar (also clipped to 32px corners) ===
                  _ModernBottomBar(
                    quiz: question,
                    toggleBookmark: toggleBookmark,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModernHeader extends StatelessWidget {
  final QuestionModel? quiz;
  final VoidCallback onNavigateToProfile;
  final VoidCallback onFollowBtn;

  const _ModernHeader({
    required this.quiz,
    required this.onNavigateToProfile,
    required this.onFollowBtn,
  });

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
                    imageUrl: quiz?.user?.profileImage,
                    username: quiz?.user?.username ?? '',
                    size: 48,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize(quiz?.user?.username ?? ''),
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          formatDate(quiz?.createdAt),
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

          OutlinedButton(
            onPressed: onFollowBtn,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white70, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
            child: Text(
              context.l10n.edit,
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

class _ModernBottomBar extends StatelessWidget {
  final QuestionModel? quiz;
  final VoidCallback toggleBookmark;

  const _ModernBottomBar({this.quiz, required this.toggleBookmark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
              if (quiz?.correctCount != null)
                _StatItem(
                  icon: Icons.check_circle,
                  color: Colors.green,
                  count: quiz?.correctCount?.toString() ?? '',
                ),
              const SizedBox(width: 24),
              if (quiz?.wrongCount != null)
                _StatItem(
                  icon: Icons.cancel,
                  color: Colors.red,
                  count: quiz?.wrongCount?.toString() ?? '',
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
                onPressed: toggleBookmark,
                icon: quiz?.isBookmarkLoading ?? false
                    ? const ProgressView()
                    : Icon(
                        quiz?.isBookmarked ?? false
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: quiz?.isBookmarked ?? false
                            ? Colors.amber
                            : Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Title & description
          Text(
            quiz?.testTitle ?? '',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (quiz?.testDescription?.isNotEmpty == true)
            Text(
              quiz?.testDescription ?? "",
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

class _AnswersList extends StatelessWidget {
  final int? questionId;
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final QuestionType? questionType;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int? answerId) setMultipleAnswer;
  final void Function(Set<int> answerId) submitAnswer;

  const _AnswersList({
    super.key,
    required this.questionId,
    required this.answers,
    required this.myAnswersId,
    required this.questionType,
    required this.isCompleted,
    required this.isLoading,
    required this.setMultipleAnswer,
    required this.submitAnswer,
  });

  @override
  Widget build(BuildContext context) {
    switch (questionType) {
      case QuestionType.multipleSelect:
        return MultipleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onItemTap: setMultipleAnswer,
          onSubmitTap: submitAnswer,
        );

      case QuestionType.singleSelect:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: submitAnswer,
        );

      case QuestionType.trueFalse:
        return TrueFalseAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: submitAnswer,
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
          onSubmitTap: submitAnswer,
        );
    }
  }
}

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

class SingleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(Set<int> answerId) onSubmitTap;

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
            onTap: () => onSubmitTap({answer.id ?? 0}),
          ),
        );
      }).toList(),
    );
  }
}

class TrueFalseAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(Set<int> answerId) onSubmitTap;

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
            onTap: () => onSubmitTap({answer.id ?? 0}),
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                    BOOKS SECTIONS
// ─────────────────────────────────────────────────────────────
class _BooksSection extends StatelessWidget {
  final ReadingSessionsState state;

  const _BooksSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const SliverToBoxAdapter(child: ProgressView());

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(6),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 3 / 4,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final session = state.sessions[index];
              return _BookCard(
                book: session.book,
                onTap: () => context.push(
                  AppRouter.bookDetailWithArgs(bookId: session.book?.id),
                ),
              );
            }, childCount: state.sessions.length),
          ),
        ),

        if (state.isLoadingMore)
          const SliverToBoxAdapter(
            child: SizedBox(width: 40, height: 40, child: ProgressView()),
          ),
      ],
    );
  }
}

class _BookCard extends StatelessWidget {
  final BookModel? book;
  final VoidCallback onTap;

  const _BookCard({super.key, this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background cover image
            Image.network(
              book?.coverImage ?? "",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade800,
                child: const Icon(Icons.book, size: 60, color: Colors.white54),
              ),
            ),

            // Gradient overlay for better text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    book?.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Author
                  Text(
                    book?.author?.fullName ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // _RatingStars(rating: book.author),
                  Text(
                    book?.totalPages?.toString() ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
