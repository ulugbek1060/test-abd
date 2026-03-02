import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/enums/knowledge_level_enum.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/domain/books/entities/book_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/users/user_profile_cubit.dart';
import 'package:testabd/features/users/user_profile_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

enum PageType {
  questions,
  block,
  books;

  static Iterable<Widget> getTabs(BuildContext context) {
    return [
      Tab(
        text: context.l10n.questions,
        icon: Icon(Icons.question_mark_rounded, size: 20),
      ),
      Tab(
        text: context.l10n.blockTest,
        icon: Icon(Icons.library_add_check, size: 20),
      ),
      // Tab(
      //   text: context.l10n.books,
      //   icon: Icon(Icons.menu_book_rounded, size: 20),
      // ),
    ];
  }
}

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
  final _scrollThreshold = 200.0;

  late var pageTye = PageType.questions;
  late var _blockKey;
  late var _questionsKey;
  late var _booksKey;

  @override
  void initState() {
    super.initState();
    _blockKey = PageStorageKey('blocksSection');
    _questionsKey = PageStorageKey('questionsSection');
    _booksKey = PageStorageKey('booksSection');
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_shouldLoadNextPage()) {
      if (pageTye == PageType.questions) {
        context.read<UserProfileCubit>().getQuestionsByPage();
      } else if (pageTye == PageType.block) {
        context.read<UserProfileCubit>().getBlocksByPage();
      }
    }
  }

  bool _shouldLoadNextPage() {
    final state = context.read<UserProfileCubit>().state;
    if (state.isLoading) return false;
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= _scrollThreshold;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserProfileCubit>();

    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: cubit.refresh,
          color: Theme.of(context).colorScheme.secondary,
          child: Scaffold(
            /// appBar
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                "@${cubit.username}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            /// body
            body: state.isLoading
                ? ProgressView()
                : CustomScrollView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      /// Profile Header Section Profile image and following and followers
                      _Header(
                        userId: state.profile?.user?.id ?? -1,
                        followersCount:
                            '${state.profile?.user?.followersCount ?? 0}',
                        followingCount:
                            '${state.profile?.user?.followingCount ?? 0}',
                        imgUrl: state.profile?.user?.profileImage ?? "",
                        level: state.profile?.user?.level,
                      ),

                      /// User bio section
                      _Subheader(
                        bio: state.profile?.user?.bio ?? "",
                        fullname: state.profile?.user?.getFullName ?? "",
                      ),

                      /// Action Buttons Follow and Message
                      _FollowAndShareButtons(
                        onFollow: cubit.followAction,
                        onShare: cubit.onShareAction,
                        isMe: state.profile?.user?.isMe == true,
                        isFollowing: state.profile?.user?.isFollowing ?? false,
                        isLoading: state.followState.isLoading,
                      ),

                      /// Statistics section
                      _Statistics(
                        totalTests:
                            state.profile?.stats?.totalTests?.toString() ?? '0',
                        correctCount:
                            state.profile?.stats?.correctAnswers?.toString() ??
                            '0',
                        wrongCount:
                            state.profile?.stats?.wrongAnswers?.toString() ??
                            '0',
                        accuracy:
                            state.profile?.stats?.accuracy?.toString() ?? '0',
                        accuracyPer: state.profile?.stats?.accuracy ?? 0,
                      ),

                      /// tabs
                      _TabsSection(
                        pageTye: pageTye,
                        onTabChange: (index) => setState(() {
                          pageTye = PageType.values[index];
                        }),
                        controller: _tabController,
                      ),

                      /// ViewBlock
                      _BlocksSection(
                        key: _blockKey,
                        state: state.blockState,
                        isEnabled: pageTye == PageType.block,
                      ),

                      /// ViewQuestions
                      _QuestionsSection(
                        key: _questionsKey,
                        state: state.questionsState,
                        isEnabled: pageTye == PageType.questions,
                      ),

                      /// ViewBooks
                      // _BooksSections(
                      //   key: _booksKey,
                      //   state: state.booksState,
                      //   isEnabled: pageTye == PageType.books,
                      // ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final String imgUrl;
  final KnowledgeLevel? level;
  final int userId;
  final String followingCount;
  final String followersCount;

  const _Header({
    super.key,
    required this.imgUrl,
    required this.level,
    required this.userId,
    required this.followersCount,
    required this.followingCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            // Profile Picture
            SizedBox(
              width: 90,
              height: 90,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,

                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.purple, width: 3),
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          width: 46,
                          height: 46,
                          imageUrl: imgUrl,
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
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 80,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          level?.getText(context) ?? "",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Following and Followers
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // followers
                  _StatItem(
                    onTap: () => context.push(
                      AppRouter.userConnectionWithUserId(
                        userId: userId,
                        connectionType: ConnectionsEnum.followers.name,
                      ),
                    ),
                    title: context.l10n.followers,
                    value: followersCount,
                  ),

                  _StatItem(
                    onTap: () => context.push(
                      AppRouter.userConnectionWithUserId(
                        userId: userId,
                        connectionType: ConnectionsEnum.following.name,
                      ),
                    ),
                    title: context.l10n.following,
                    value: followingCount,
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

class _Subheader extends StatelessWidget {
  final String fullname;
  final String bio;

  const _Subheader({super.key, required this.fullname, required this.bio});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullname,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 4),

            Text(bio, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _FollowAndShareButtons extends StatelessWidget {
  final VoidCallback onFollow;
  final VoidCallback onShare;
  final bool isLoading;
  final bool isFollowing;
  final bool isMe;

  const _FollowAndShareButtons({
    super.key,
    required this.isMe,
    required this.isLoading,
    required this.isFollowing,
    required this.onFollow,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            if (!isMe)
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFollowing
                        ? Theme.of(context).colorScheme.surface
                        : Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(6),
                  ),
                  onPressed: isLoading ? null : onFollow,
                  child: isLoading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: ProgressView(strokeWidth: 3),
                        )
                      : Text(
                          isFollowing
                              ? context.l10n.followed
                              : context.l10n.follow,
                          style: TextStyle(
                            color: isFollowing
                                ? Theme.of(context).colorScheme.onSurface
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),

            if (!isMe) const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(6),
                ),
                onPressed: onShare,
                child: Text(
                  context.l10n.shareProfile,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isFollowing
                        ? Theme.of(context).colorScheme.onSurface
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Statistics extends StatelessWidget {
  final String totalTests;
  final String correctCount;
  final String wrongCount;
  final String accuracy;
  final double accuracyPer;

  const _Statistics({
    super.key,
    required this.totalTests,
    required this.correctCount,
    required this.wrongCount,
    required this.accuracy,
    required this.accuracyPer,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.analytics_rounded, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      context.l10n.quizPerformance,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(120),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildListDelegate([
              _PerformanceItem(
                title: context.l10n.totalTests,
                value: totalTests,
                icon: Icons.library_add_check_rounded,
                color: Colors.blue,
              ),
              _PerformanceItem(
                title: context.l10n.correctAnswers,
                value: correctCount,
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              _PerformanceItem(
                title: context.l10n.wrongAnswers,
                value: wrongCount,
                icon: Icons.cancel,
                color: Colors.red,
              ),
              _PerformanceItem(
                title: context.l10n.accuracy,
                value: accuracy,
                icon: Icons.balance,
                color: Colors.orange,
                progress: accuracyPer,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _TabsSection extends StatelessWidget {
  final PageType pageTye;
  final void Function(int index) onTabChange;
  final TabController controller;

  const _TabsSection({
    required this.pageTye,
    required this.onTabChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        TabBar(
          unselectedLabelColor: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.6),
          labelColor: Theme.of(context).colorScheme.onSurface,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          onTap: onTabChange,
          controller: controller,
          tabs: PageType.getTabs(context).toList(),
        ),
      ),
    );
  }
}

// ------------------------------------------------------
// Block question section
// ------------------------------------------------------
class _BlocksSection extends StatelessWidget {
  final BlocksState state;
  final bool isEnabled;

  const _BlocksSection({
    super.key,
    required this.state,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    /// for disabled state
    if (!isEnabled) {
      return SliverToBoxAdapter(child: const SizedBox.shrink());
    }

    /// loading state
    if (state.isLoading) {
      return SliverToBoxAdapter(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: ProgressView(),
        ),
      );
    }

    /// for active state
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final topic = state.blocks[index];
              return _BlockCard(
                title: topic.title ?? '',
                description: topic.description ?? '',
                questionCount: topic.totalQuestions ?? 0,
                createdAt: topic.createdAt ?? DateTime.now(),
                onTap: () => context.push(
                  AppRouter.userBlockDetailWithBlockId(topic.id ?? 0),
                ),
              );
            }, childCount: state.blocks.length),
          ),
        ),

        if (state.isLoadingMore)
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: const SliverToBoxAdapter(child: ProgressView()),
          ),
      ],
    );
  }
}

class _BlockCard extends StatelessWidget {
  final String title;
  final String description;
  final int questionCount;
  final DateTime createdAt;
  final VoidCallback onTap;

  const _BlockCard({
    super.key,
    required this.title,
    required this.description,
    required this.questionCount,
    required this.createdAt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.onSurfaceColor(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --------------------------------------------------
              // TITLE ROW
              // --------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.onSurfaceColor(context),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // --------------------------------------------------
              // DESCRIPTION
              // --------------------------------------------------
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
              ),

              const Spacer(),

              // --------------------------------------------------
              // INFO
              // --------------------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoChip(
                    icon: Icons.help_outline,
                    label: "$questionCount questions",
                  ),
                  const SizedBox(height: 6),
                  _InfoChip(icon: Icons.schedule, label: formatDate(createdAt)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.onSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const _StatItem({required this.title, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------
// Questions section
// ------------------------------------------------------
class _QuestionsSection extends StatelessWidget {
  final QuestionsState state;
  final bool isEnabled;

  const _QuestionsSection({
    super.key,
    required this.state,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      return SliverToBoxAdapter(child: SizedBox.shrink());
    }

    /// loading state
    if (state.isLoading) {
      return SliverToBoxAdapter(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: ProgressView(),
        ),
      );
    }

    /// for active state
    return SliverMainAxisGroup(
      slivers: [
        SliverList.separated(
          itemCount: state.questions.length,
          itemBuilder: (_, index) => QuestionItem(
            onTap: () => context.push(
              AppRouter.userQuestionDetailWithBlockId(
                state.questions[index].id,
              ),
            ),
            question: state.questions[index],
            isFirst: index == 0,
            isLast: index == state.questions.length - 1,
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        ),
        if (state.isLoadingMore)
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: const SliverToBoxAdapter(child: ProgressView()),
          ),
      ],
    );
  }
}

class QuestionItem extends StatelessWidget {
  final QuestionModel question;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  const QuestionItem({
    super.key,
    required this.question,
    required this.onTap,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: isLast ? 16 : 8,
          left: 16,
          right: 16,
          top: isFirst ? 16 : 0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                question.testTitle ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                question.testDescription ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, height: 1.4, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Bottom Row (modern spread layout)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Difficulty Badge (colored, modern pill)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          question.difficultyPercentage
                              ?.toDifficulty()
                              .color
                              .withOpacity(0.12) ??
                          Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:
                            question.difficultyPercentage
                                ?.toDifficulty()
                                .color
                                .withOpacity(0.3) ??
                            Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      question.difficultyPercentage
                              ?.toDifficulty()
                              .name
                              .toUpperCase() ??
                          "",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: question.difficultyPercentage
                            ?.toDifficulty()
                            .color,
                      ),
                    ),
                  ),

                  // Attempts
                  Row(
                    children: [
                      const Icon(
                        Icons.repeat_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${question.userAttemptCount} attempts',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Time
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 16, color: Colors.grey[400]),
                      const SizedBox(width: 6),
                      Text(
                        formatDate(question.createdAt),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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

// ------------------------------------------------------
// Book section
// ------------------------------------------------------
// class _BooksSections extends StatelessWidget {
//   final BooksState state;
//   final bool isEnabled;
//
//   const _BooksSections({
//     super.key,
//     required this.state,
//     required this.isEnabled,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     /// for disabled state
//     if (!isEnabled) {
//       return SliverToBoxAdapter(child: const SizedBox.shrink());
//     }
//
//     /// loading state
//     if (state.isLoading) {
//       return SliverPadding(
//         padding: const EdgeInsets.all(8),
//         sliver: SliverGrid(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12.0,
//             mainAxisSpacing: 12.0,
//             childAspectRatio: 1.0,
//           ),
//           delegate: SliverChildBuilderDelegate((
//             BuildContext context,
//             int index,
//           ) {
//             return Center(child: ProgressView());
//           }, childCount: 4),
//         ),
//       );
//     }
//
//     /// coming soon
//     return SliverPadding(
//       padding: const EdgeInsets.all(6),
//       sliver: SliverGrid(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//           childAspectRatio: 3 / 4,
//         ),
//         delegate: SliverChildBuilderDelegate((context, index) {
//           final book = books[index];
//           return BookCard(book: book);
//         }, childCount: books.length),
//       ),
//     );
//   }
// }
//
// class BookCard extends StatelessWidget {
//   final BookModel book;
//
//   const BookCard({super.key, required this.book});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 6,
//       clipBehavior: Clip.hardEdge,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background cover image
//           CachedNetworkImage(
//             imageUrl: book.author?.image ?? "",
//             fit: BoxFit.cover,
//             placeholder: (_, __) => Container(
//               color: Colors.grey.shade800,
//               child: const Icon(Icons.book, size: 60, color: Colors.white54),
//             ),
//             errorWidget: (_, __, ___) => Container(
//               color: Colors.grey.shade800,
//               child: const Icon(Icons.book, size: 60, color: Colors.white54),
//             ),
//           ),
//
//           // Gradient overlay for better text readability
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//                 stops: const [0.5, 1.0],
//               ),
//             ),
//           ),
//
//           // Content
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 Text(
//                   book.title,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                         color: Colors.black,
//                         offset: Offset(1, 1),
//                         blurRadius: 3,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//
//                 // Author
//                 Text(
//                   book.author,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.9),
//                     fontSize: 12,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//
//                 _RatingStars(rating: book.rating),
//
//                 Text(
//                   book.rating.toStringAsFixed(1),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _RatingStars extends StatelessWidget {
  final double rating;

  const _RatingStars({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final filled = rating >= index + 1;
        final halfFilled = rating > index && rating < index + 1;

        return Icon(
          filled
              ? Icons.star_rounded
              : halfFilled
              ? Icons.star_half_rounded
              : Icons.star_border_rounded,
          size: 14,
          color: const Color(0xFFFFC107),
        );
      }),
    );
  }
}

// ------------------------------------------------------
// Section Items
// ------------------------------------------------------
class _PerformanceItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double? progress;

  const _PerformanceItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 14,
            ),
          ),
          if (progress != null)
            LinearProgressIndicator(
              value: (progress ?? 1) / 100,
              backgroundColor: Color(0xFFFFFFFF),
              valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              borderRadius: BorderRadius.circular(4),
            ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;

  _SliverAppBarDelegate(this._tabBar, {required this.backgroundColor});

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => Container(color: backgroundColor, child: _tabBar);

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
