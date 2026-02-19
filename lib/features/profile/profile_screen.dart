import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/theme/app_icons.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/enums/connections_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/enums/knowledge_level_enum.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/features/profile/profile_cubit.dart';
import 'package:testabd/features/profile/profile_state.dart';
import 'package:testabd/router/app_router.dart';

enum PageType { questions, block, books }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => locator<ProfileCubit>(),
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

  late ScrollController _scrollController;
  final _scrollThreshold = 200.0;

  late var pageTye;
  late var _blockKey;
  late var _questionsKey;
  late var _booksKey;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    pageTye = PageType.questions;
    _blockKey = PageStorageKey('blocksSection');
    _questionsKey = PageStorageKey('questionsSection');
    _booksKey = PageStorageKey('booksSection');
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  void _onScroll() {
    if (_shouldLoadNextPage()) {
      if (pageTye == PageType.questions) {
        context.read<ProfileCubit>().fetchQuestionsByPage();
      }
      if (pageTye == PageType.block) {
        // context.read<ProfileCubit>().fetchMyBlocks();
      }
    }
  }

  bool _shouldLoadNextPage() {
    final state = context.read<ProfileCubit>().state;
    if (state.isLoading) {
      return false;
    }
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= _scrollThreshold;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (s1, s2) =>
          s1.isLoading != s2.isLoading ||
          s1.myInfoModel != s2.myInfoModel ||
          s1.userConnectionsState != s2.userConnectionsState,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: cubit.refresh,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                '@${state.myInfoModel?.username}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // body
            body: state.isLoading
                ? ProgressView()
                : CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      /// Header
                      HeaderSection(
                        imageUrl: state.myInfoModel?.profileImage ?? '',
                        tests:
                            state.myInfoModel?.testsSolved?.toString() ?? '0',
                        followers: state
                            .userConnectionsState
                            .connections
                            .followers
                            .length
                            .toString(),
                        followings: state
                            .userConnectionsState
                            .connections
                            .following
                            .length
                            .toString(),
                        level: state.myInfoModel?.level ?? KnowledgeLevel.none,
                        fullName:
                            '${state.myInfoModel?.firstName} ${state.myInfoModel?.lastName}',
                        bio: state.myInfoModel?.bio ?? '',
                        onTestsTap: () {},
                        onFollowersTap: () => context.push(
                          AppRouter.profileConnectionWithUserId(
                            connectionType: ConnectionsEnum.followers.name,
                          ),
                        ),
                        onFollowingTap: () => context.push(
                          AppRouter.profileConnectionWithUserId(
                            connectionType: ConnectionsEnum.following.name,
                          ),
                        ),
                        onEditProfileTap: () => context.push(AppRouter.editProfile),
                      ),

                      /// Statistics Cards
                      SubHeaderSection(
                        coins: state.myInfoModel?.coins?.toString() ?? '0',
                        correctAnswers: state.myInfoModel?.correctCount?.toString() ?? '0',
                        wrongAnswers: state.myInfoModel?.wrongCount?.toString() ?? '0',
                        accuracy: state.myInfoModel?.findAccuracy().toString() ?? '0',
                        accuracyProgress: state.myInfoModel?.findAccuracy() ?? 0,
                        onQuestionsBookmarkTap: () => context.push(AppRouter.bookmarkQuestions),
                      ),

                      /// tabBar
                      TabsSection(
                        pageTye: pageTye,
                        onTabChange: (index) => setState(() {
                          switch (index) {
                            case 0:
                              pageTye = PageType.questions;
                            case 1:
                              pageTye = PageType.block;
                            case 2:
                              pageTye = PageType.books;
                          }
                        }),
                        controller: _tabController,
                      ),

                      BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (s1, s2) => s1.blocksState != s2.blocksState,
                        builder: (_, s) => MyBlockSection(
                          key: _blockKey,
                          isEnabled: pageTye == PageType.block,
                          state: s.blocksState,
                        ),
                      ),

                      BlocBuilder<ProfileCubit, ProfileState>(
                        buildWhen: (s1, s2) =>
                            s1.questionsState != s2.questionsState,
                        builder: (_, s) => MyQuestionsSection(
                          key: _questionsKey,
                          isEnabled: pageTye == PageType.questions,
                          state: s.questionsState,
                        ),
                      ),

                      MyBooksSection(
                        key: _booksKey,
                        isEnabled: pageTye == PageType.books,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String imageUrl;
  final String followers;
  final String followings;
  final String tests;
  final String fullName;
  final String bio;
  final KnowledgeLevel level;
  final VoidCallback onFollowersTap;
  final VoidCallback onFollowingTap;
  final VoidCallback onTestsTap;
  final VoidCallback onEditProfileTap;

  const HeaderSection({
    super.key,
    required this.imageUrl,
    required this.followers,
    required this.followings,
    required this.tests,
    required this.fullName,
    required this.bio,
    required this.level,
    required this.onFollowersTap,
    required this.onFollowingTap,
    required this.onTestsTap,
    required this.onEditProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
                                level.getText(context),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 20),

                /// Stats
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // _StatItem(
                      //   title: "Tests",
                      //   value: tests,
                      //   onTap: onTestsTap,
                      // ),
                      _StatItem(
                        title: "Followers",
                        value: followers,
                        onTap: onFollowersTap,
                      ),
                      _StatItem(
                        title: "Following",
                        value: followings,
                        onTap: onFollowingTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // fullname bui section
            Text(
              fullName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              bio,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),

            // edit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onEditProfileTap,
                child: Text(
                  'Edit profile',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
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

class SubHeaderSection extends StatelessWidget {
  final String coins;
  final String correctAnswers;
  final String wrongAnswers;
  final String accuracy;
  final double accuracyProgress;
  final VoidCallback onQuestionsBookmarkTap;

  const SubHeaderSection({
    super.key,
    required this.accuracy,
    required this.coins,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.accuracyProgress,
    required this.onQuestionsBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 16,
            right: 16,
            bottom: 8,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Icon(
                  Icons.analytics_rounded,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                ),
                const SizedBox(width: 8),
                Text(
                  'Statistics',
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
                title: 'Coins',
                value: coins,
                icon: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withAlpha(50),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppIcons.coin),
                ),
                color: Colors.blue,
              ),
              _PerformanceItem(
                title: 'Correct Answers',
                value: correctAnswers,
                icon: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withAlpha(50),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check_circle, color: Colors.green),
                ),
                color: Colors.green,
              ),
              _PerformanceItem(
                title: 'Wrong Answers',
                value: wrongAnswers,
                icon: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(50),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.cancel, color: Colors.red),
                ),
                color: Colors.red,
              ),
              _PerformanceItem(
                title: 'Accuracy',
                value: accuracy,
                icon: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withAlpha(50),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.line_weight, color: Colors.orange),
                ),
                color: Colors.orange,
                progress: accuracyProgress,
              ),
            ]),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
          sliver: SliverToBoxAdapter(
            child: GestureDetector(
              onTap: onQuestionsBookmarkTap,
              child: _PerformanceItem(
                title: 'Questions Bookmark',
                value: '12',
                icon: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(50),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.bookmark, color: Colors.blue),
                ),
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabsSection extends StatelessWidget {
  final PageType pageTye;
  final void Function(int index) onTabChange;
  final TabController controller;

  const TabsSection({
    super.key,
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
          unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
          labelColor: Theme.of(context).colorScheme.onSurface,
          onTap: onTabChange,
          controller: controller,
          tabs: [
            Tab(text: 'Savollar'),
            Tab(text: 'Bloklar'),
            Tab(text: 'Kitoblar'),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Questions block section ----------------
class MyBlockSection extends StatelessWidget {
  final bool isEnabled;
  final MyBlocksState state;

  const MyBlockSection({
    super.key,
    required this.isEnabled,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SliverToBoxAdapter(child: SizedBox.shrink());

    /// loading state
    if (state.isLoading) {
      return SliverPadding(
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
            return Center(child: ProgressView());
          }, childCount: 4),
        ),
      );
    }

    /// for active state
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final question = state.myQuestions[index];

          if (question.id == -1) {
            return GestureDetector(
              onTap: () {
                context.push(AppRouter.createBlock);
              },
              child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add question',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return QuestionCard(
            title: question.title ?? '',
            description: question.description ?? '',
            createdAt: question.createdAt,
            correctAnswers: 2,
            wrongAnswers: 2,
            difficulty: Difficulty.easy,
            onTap: () => context.push(
              AppRouter.blockDetail
              // AppRouter.questionDetailWithQuestionId(question.id ?? -1),
            ),
          );
        }, childCount: state.myQuestions.length),
      ),
    );
  }
}

/// ---------------- My questions section ----------------
class MyQuestionsSection extends StatelessWidget {
  final bool isEnabled;
  final MyQuestionsState state;

  const MyQuestionsSection({
    super.key,
    required this.isEnabled,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SliverToBoxAdapter(child: SizedBox.shrink());

    /// loading state
    if (state.isLoading) {
      return SliverPadding(
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
            return Center(child: ProgressView());
          }, childCount: 4),
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
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final question = state.questions[index];

              if (question.id == -1) {
                return GestureDetector(
                  onTap: () {
                    context.push(AppRouter.createQuestions);
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add question',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return QuestionCard(
                title: question.testTitle ?? '',
                description: question.testDescription ?? '',
                createdAt: question.createdAt,
                correctAnswers: 2,
                wrongAnswers: 2,
                difficulty: Difficulty.easy,
                onTap: () => context.push(
                  AppRouter.myQuestionDetailWithArgs(question.id ?? -1),
                ),
              );
            }, childCount: state.questions.length),
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

/// ---------------- My books section ----------------
class MyBooksSection extends StatelessWidget {
  final bool isEnabled;

  const MyBooksSection({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SliverToBoxAdapter(child: SizedBox.shrink());
    return SliverFillRemaining(child: Center(child: Text('My books')));
  }
}

/// ---------------- COMPONENTS ----------------
class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const _StatItem({
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

class _PerformanceItem extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
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
        color: Theme.of(context).colorScheme.surface,
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
              icon,
              const Spacer(),
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
          if (progress != null)
            LinearProgressIndicator(
              value: (progress ?? 1) / 100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Color(0xffD6D6D6),
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

class QuestionCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? createdAt;
  final int? correctAnswers;
  final int? wrongAnswers;
  final Difficulty difficulty;
  final void Function()? onTap;

  const QuestionCard({
    super.key,
    required this.title,
    required this.description,
    this.createdAt,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.difficulty,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
          //     blurRadius: 12,
          //     offset: const Offset(0, 0),
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title row + difficulty
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _DifficultyChip(
                    label: difficulty.name.toUpperCase(),
                    color: difficulty.color,
                  ),
                ],
              ),
              const SizedBox(height: 4),

              /// Description
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const Spacer(),

              /// Stats row
              Row(
                children: [
                  _QuestionStatItem(
                    icon: Icons.check_circle_outline,
                    value: correctAnswers,
                    color: const Color(0xFF4CAF50),
                  ),
                  const SizedBox(width: 8),
                  _QuestionStatItem(
                    icon: Icons.cancel_outlined,
                    value: wrongAnswers,
                    color: const Color(0xFFF44336),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _DateChip(date: formatDate(createdAt)),
            ],
          ),
        ),
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  final String label;
  final Color color;

  const _DifficultyChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _QuestionStatItem extends StatelessWidget {
  final IconData icon;
  final int? value;
  final Color color;

  const _QuestionStatItem({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            value?.toString() ?? '0',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String date;

  const _DateChip({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.onSurfaceColor(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule,
            size: 14,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 6),
          Text(
            date,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
