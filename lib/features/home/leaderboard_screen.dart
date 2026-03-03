import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_icons.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/account/entities/leaderboard_model.dart';
import 'package:testabd/features/home/leaderboard_cubit.dart';
import 'package:testabd/features/home/leaderboard_state.dart';
import 'package:testabd/router/app_router.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<LeaderboardCubit>()..getTopUsers(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if ((offset - _scrollOffset).abs() > 8) {
      setState(() => _scrollOffset = offset);
    }
    if (_shouldLoadNextPage()) {
      context.read<LeaderboardCubit>().getTopUsersByPage();
    }
  }

  bool _shouldLoadNextPage() {
    final state = context.read<LeaderboardCubit>().state;
    if (state.isLoading || state.isLastPage || state.isLastPage) {
      return false;
    }
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= _scrollThreshold;
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) return Colors.transparent;
    final opacity = (_scrollOffset / 160).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _getAppBarBackground(),
        elevation: _scrollOffset > 80 ? 4 : 0,
        foregroundColor: _scrollOffset > 120 ? scheme.onSurface : Colors.white,
        title: const Text(
          "Leaderboard",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: context.read<LeaderboardCubit>().refresh,
        child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
          builder: (context, state) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Gradient Header
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 110, 20, 20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFE1306C), Color(0xFF405DE6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.emoji_events_rounded,
                          color: Colors.white,
                          size: 62,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Top Players",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "This week's champions",
                          style: TextStyle(
                            fontSize: 16.5,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Top 3 Podium
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  sliver: _TopThreeSection(),
                ),

                // Compact Leaderboard List
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: _LeaderboardList(state: state),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     TOP 3 PODIUM
// ─────────────────────────────────────────────────────────────
class _TopThreeSection extends StatelessWidget {
  const _TopThreeSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) {
          /// loading widget
          if (state.isLoading || state.leaderboard.isEmpty) {
            return SizedBox.shrink();
          }

          /// main widget
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: state
                .podiumForUI()
                .mapIndexed(
                  (index, e) => TopUser(
                    rankAsset: e.todayRank.podiumString,
                    name: capitalize(e.username),
                    profileImage: e.profileImage ?? '',
                    score: e.coins,
                    big: index == 1,
                    key: ValueKey(e.username),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class TopUser extends StatelessWidget {
  final String rankAsset;
  final String profileImage;
  final String name;
  final int score;
  final bool big;

  const TopUser({
    super.key,
    required this.rankAsset,
    required this.profileImage,
    required this.name,
    required this.score,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: big ? 110 : 90,
          width: big ? 110 : 90,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Rank background image
              SizedBox(
                height: big ? 110 : 90,
                width: big ? 110 : 90,
                child: Image.asset(rankAsset, fit: BoxFit.contain),
              ),

              // Avatar at bottom center
              Positioned(
                bottom: 10,
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: big ? 30 : 20,
                    height: big ? 30 : 20,
                    imageUrl: profileImage,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
                    errorWidget: (_, __, ___) =>
                        Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 12, height: 12, child: Image.asset(AppIcons.coin)),
            const SizedBox(width: 4),
            Text(
              score.toString(),
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     COMPACT LEADERBOARD TILE (now much smaller)
// ─────────────────────────────────────────────────────────────
class _LeaderboardList extends StatelessWidget {
  final LeaderboardState state;

  const _LeaderboardList({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const SliverFillRemaining(child: Center(child: ProgressView()));
    }

    return SliverList.separated(
      itemCount: state.leaderboard.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return _CompactLeaderboardTile(
          user: state.leaderboard[index],
          onTap: () => context.push(
            AppRouter.userProfileWithUsername(
              state.leaderboard[index].username,
            ),
          ),
        );
      },
    );
  }
}

class _CompactLeaderboardTile extends StatelessWidget {
  final LeaderboardUser user;
  final VoidCallback onTap;

  const _CompactLeaderboardTile({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        // very compact
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Rank
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: scheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Text(
                user.todayRank.toString(),
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: scheme.primary,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Avatar (smaller)
            ClipOval(
              child: CachedNetworkImage(
                width: 42,
                height: 42,
                imageUrl: user.profileImage ?? '',
                fit: BoxFit.cover,
                placeholder: (_, __) => Image.asset(AppImages.defaultAvatar),
                errorWidget: (_, __, ___) =>
                    Image.asset(AppImages.defaultAvatar),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                user.username,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Coins (compact)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppIcons.coin, width: 18),
                const SizedBox(width: 4),
                Text(
                  user.coins.toString(),
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber,
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
