import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/enums/knowledge_level_enum.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
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
                              fontSize: 15.5,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            labelColor: scheme.onSurface,
                            unselectedLabelColor: scheme.onSurface.withOpacity(
                              0.6,
                            ),
                            indicatorColor: scheme.primary,
                            indicatorWeight: 3,
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
                  fontSize: 26,
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
              fontSize: 14.5,
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
//                     BLOCKS, QUESTIONS, BOOKS SECTIONS
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
          childAspectRatio: 1.05,
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
                    size: 24,
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

// (You can continue with _QuestionsSection and _BooksSection in the same modern card style – let me know if you want the full expanded version for those too)
class _QuestionsSection extends StatelessWidget {
  final QuestionsState state;

  const _QuestionsSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const SliverToBoxAdapter(child: ProgressView());

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            itemCount: state.questions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final q = state.questions[index];
              return _ModernQuestionCard(
                question: q,
                isLast: index == state.questions.length,
                isFirst: index == 0,
                onTap: () =>
                    context.push(AppRouter.myQuestionDetailWithArgs(q.id)),
              );
            },
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

class _ModernQuestionCard extends StatelessWidget {
  final QuestionModel question;
  final VoidCallback onTap;
  final bool isLast;
  final bool isFirst;

  const _ModernQuestionCard({
    super.key,
    required this.question,
    required this.onTap,
    required this.isFirst,
    required this.isLast,
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
          color: scheme.surface,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Difficulty badge + Date
            Row(
              children: [
                _DifficultyBadge(difficulty: difficulty),
                const Spacer(),
                Text(
                  formatDate(question.createdAt),
                  style: TextStyle(
                    fontSize: 13.5,
                    color: scheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Question Text (big & bold)
            Text(
              question.questionText ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.5,
                height: 1.35,
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),

            const SizedBox(height: 20),

            // Bottom stats row
            Row(
              children: [
                // Correct / Wrong (if available)
                if (question.correctCount != null ||
                    question.wrongCount != null)
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${question.correctCount ?? 0}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.cancel_rounded,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${question.wrongCount ?? 0}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),

                const Spacer(),

                // View button pill
                Container(
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
              ],
            ),
          ],
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
        color: difficulty.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: difficulty.color.withOpacity(0.3), width: 1),
      ),
      child: Text(
        difficulty.name.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: difficulty.color,
        ),
      ),
    );
  }
}

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
