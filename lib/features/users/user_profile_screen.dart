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
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/users/user_profile_cubit.dart';
import 'package:testabd/features/users/user_profile_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

enum PageType { questions, block }

class UserProfileScreen extends StatelessWidget {
  final String username;

  const UserProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<UserProfileCubit>(param1: username)..load(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  PageType _currentPage = PageType.questions;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
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

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        final user = state.profile?.user;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _getAppBarBackground(),
            elevation: _scrollOffset > 80 ? 4 : 0,
            foregroundColor: _scrollOffset > 120
                ? scheme.onSurface
                : Colors.white,
            title: Text(
              "@${user?.username ?? ''}",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
            centerTitle: true,
          ),
          body: state.isLoading && user == null
              ? const ProgressView()
              : RefreshIndicator(
                  onRefresh: context.read<UserProfileCubit>().refresh,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      // ── PREMIUM GRADIENT HEADER (highlighted fullname & bio) ──
                      SliverToBoxAdapter(
                        child: _PremiumHeader(
                          imageUrl: user?.profileImage ?? '',
                          level: user?.level ?? KnowledgeLevel.none,
                          fullName: user?.getFullName ?? '',
                          bio: user?.bio ?? '',
                          followers: '${user?.followersCount ?? 0}',
                          following: '${user?.followingCount ?? 0}',
                          onFollowers: () => context.push(
                            AppRouter.userConnectionWithUserId(
                              userId: user?.id ?? 0,
                              connectionType: ConnectionsEnum.followers.name,
                            ),
                          ),
                          onFollowing: () => context.push(
                            AppRouter.userConnectionWithUserId(
                              userId: user?.id ?? 0,
                              connectionType: ConnectionsEnum.following.name,
                            ),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 12)),

                      // ── FOLLOW + SHARE BUTTONS (no Edit button) ──
                      if (user != null && !user.isMe!)
                        _FollowAndShareButtons(
                          isFollowing: user.isFollowing ?? false,
                          isLoading: state.followState.isLoading,
                          onFollow: context
                              .read<UserProfileCubit>()
                              .followAction,
                          onShare: context
                              .read<UserProfileCubit>()
                              .onShareAction,
                        ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // ── STATISTICS ──
                      _Statistics(
                        totalTest:
                            state.profile?.stats?.totalTests?.toString() ?? '0',
                        correct:
                            state.profile?.stats?.correctAnswers?.toString() ??
                            '0',
                        wrong:
                            state.profile?.stats?.wrongAnswers?.toString() ??
                            '0',
                        accuracy:
                            state.profile?.stats?.accuracy?.toString() ?? '0',
                        accuracyPer: state.profile?.stats?.accuracy ?? 0,
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
                            tabs: const [
                              Tab(text: "Questions"),
                              Tab(text: "Blocks"),
                            ],
                          ),
                        ),
                      ),

                      // ── CONTENT ──
                      if (_currentPage == PageType.block)
                        _BlocksSection(state: state.blockState),
                      if (_currentPage == PageType.questions)
                        _QuestionsSection(state: state.questionsState),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM HEADER (highlighted fullname & bio)
// ─────────────────────────────────────────────────────────────
class _PremiumHeader extends StatelessWidget {
  final String imageUrl;
  final KnowledgeLevel? level;
  final String fullName;
  final String bio;
  final String followers;
  final String following;
  final VoidCallback onFollowers;
  final VoidCallback onFollowing;

  const _PremiumHeader({
    required this.imageUrl,
    required this.level,
    required this.fullName,
    required this.bio,
    required this.followers,
    required this.following,
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
                      placeholder: (_, __) =>
                          Image.asset(AppImages.defaultAvatar),
                      errorWidget: (_, __, ___) =>
                          Image.asset(AppImages.defaultAvatar),
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
                    level?.getText(context) ?? "",
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

          // Highlighted Fullname
          Text(
            fullName,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Highlighted Bio
          Text(
            bio.isEmpty ? "No bio yet" : bio,
            style: TextStyle(
              fontSize: 15.5,
              height: 1.45,
              color: Colors.white.withOpacity(0.95),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CountPill(
                title: context.l10n.followers,
                value: followers,
                onTap: onFollowers,
              ),
              const SizedBox(width: 40),
              _CountPill(
                title: context.l10n.following,
                value: following,
                onTap: onFollowing,
              ),
            ],
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
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 13.5,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     FOLLOW + SHARE BUTTONS
// ─────────────────────────────────────────────────────────────
class _FollowAndShareButtons extends StatelessWidget {
  final bool isFollowing;
  final bool isLoading;
  final VoidCallback onFollow;
  final VoidCallback onShare;

  const _FollowAndShareButtons({
    required this.isFollowing,
    required this.isLoading,
    required this.onFollow,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: isLoading ? null : onFollow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing
                      ? scheme.surfaceVariant
                      : scheme.primary,
                  foregroundColor: isFollowing
                      ? scheme.onSurface
                      : scheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      )
                    : Text(
                        isFollowing
                            ? context.l10n.followed
                            : context.l10n.follow,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: onShare,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: scheme.primary),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(context.l10n.shareProfile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     STATISTICS (modern cards)
// ─────────────────────────────────────────────────────────────
class _Statistics extends StatelessWidget {
  final String totalTest;
  final String correct;
  final String wrong;
  final String accuracy;
  final double accuracyPer;

  const _Statistics({
    required this.totalTest,
    required this.correct,
    required this.wrong,
    required this.accuracy,
    required this.accuracyPer,
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
            value: totalTest,
            icon: Icons.checklist_rtl_outlined,
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

// Modern Tab Delegate
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

// ── Blocks & Questions Sections (premium cards) ──
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

class _QuestionsSection extends StatelessWidget {
  final QuestionsState state;

  const _QuestionsSection({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) return const SliverToBoxAdapter(child: ProgressView());

    return SliverPadding(
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
            onTap: () => context.push(AppRouter.myQuestionDetailWithArgs(q.id)),
          );
        },
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: difficulty.color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        difficulty.name.toUpperCase(),
        style: TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          color: difficulty.color,
        ),
      ),
    );
  }
}
