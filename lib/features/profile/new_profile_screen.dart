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
import 'package:testabd/features/profile/profile_cubit.dart';
import 'package:testabd/features/profile/profile_state.dart';
import 'package:testabd/router/app_router.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProfileCubit>(),
      child: const _View(),
    );
  }
}

enum PageType { questions, block, books }

class _View extends StatefulWidget {
  const _View({super.key});

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
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (s1, s2) =>
          s1.isLoading != s2.isLoading ||
          s1.myInfoModel != s2.myInfoModel ||
          s1.userConnectionsState != s2.userConnectionsState,

      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: context.read<ProfileCubit>().refresh,
          child: Scaffold(
            appBar: AppBar(
              title: Text("@${state.myInfoModel?.username ?? ""}"),
              centerTitle: true,
            ),

            body: CustomScrollView(
              slivers: [
                /// HEADER
                _Header(
                  imageUrl: state.myInfoModel?.profileImage ?? "",
                  level: state.myInfoModel?.level ?? KnowledgeLevel.none,
                  fullName: state.myInfoModel?.fullName ?? "",
                  bio: state.myInfoModel?.bio ?? "",
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

                /// SUBHEADER
                _SubHeader(
                  coins: state.myInfoModel?.coins?.toString() ?? "0",
                  correct: state.myInfoModel?.correctCount?.toString() ?? "0",
                  wrong: state.myInfoModel?.wrongCount?.toString() ?? "0",
                  accuracy: state.myInfoModel?.findAccuracy().toString() ?? "0",
                  onBookmark: () => context.push(AppRouter.bookmarkQuestions),
                ),

                /// CONTENT
                _TabsSection(
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
                  builder: (_, s) => _BlocksSection(
                    key: _blockKey,
                    isEnabled: pageTye == PageType.block,
                    state: s.blocksState,
                  ),
                ),

                BlocBuilder<ProfileCubit, ProfileState>(
                  buildWhen: (s1, s2) => s1.questionsState != s2.questionsState,
                  builder: (_, s) => _QuestionsSection(
                    key: _questionsKey,
                    isEnabled: pageTye == PageType.questions,
                    state: s.questionsState,
                  ),
                ),

                _BooksSection(
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

class _Header extends StatelessWidget {
  final String imageUrl;
  final KnowledgeLevel level;
  final String fullName;
  final String bio;
  final String followers;
  final String following;
  final VoidCallback onEdit;
  final VoidCallback onFollowers;
  final VoidCallback onFollowing;

  const _Header({
    super.key,
    required this.imageUrl,
    required this.level,
    required this.fullName,
    required this.bio,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onFollowers,
    required this.onFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      countItem(context, "Followers", followers, onFollowers),
                      countItem(context, "Following", following, onFollowing),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // fullname
            Text(
              fullName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),

            // bio
            Text(
              bio,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onEdit,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Edit Profile"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget countItem(
    BuildContext context,
    String title,
    String value,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  final String coins;
  final String correct;
  final String wrong;
  final String accuracy;
  final VoidCallback onBookmark;

  const _SubHeader({
    super.key,
    required this.coins,
    required this.correct,
    required this.wrong,
    required this.accuracy,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 12),
                _SubheaderItem(
                  backgroundColor: Colors.orange,
                  title: "Coins",
                  value: coins,
                  leading: Icon(
                    Icons.monetization_on_rounded,
                    size: 35,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 12),
                _SubheaderItem(
                  backgroundColor: Colors.green,
                  title: "Correct",
                  value: correct,
                  leading: Icon(
                    Icons.check_circle_rounded,
                    size: 34,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 12),
                _SubheaderItem(
                  backgroundColor: Colors.red,
                  title: "Wrong",
                  value: wrong,
                  leading: Icon(
                    Icons.error_rounded,
                    size: 34,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 12),
                _SubheaderItem(
                  backgroundColor: Colors.blue,
                  title: "Accuracy",
                  value: accuracy,
                  leading: Icon(
                    Icons.error_rounded,
                    size: 34,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: onBookmark,
              icon: const Icon(Icons.bookmark),
              label: const Text("Bookmarked Questions"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabsSection extends StatelessWidget {
  final PageType pageTye;
  final void Function(int index) onTabChange;
  final TabController controller;

  const _TabsSection({
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
          tabs: [
            Tab(
              text: 'Savollar',
              icon: Icon(Icons.question_mark_rounded, size: 20),
            ),
            Tab(text: 'Bloklar', icon: Icon(Icons.library_add_check, size: 20)),
            Tab(
              text: 'Kitoblar',
              icon: Icon(Icons.menu_book_rounded, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- Questions block section ----------------
class _BlocksSection extends StatelessWidget {
  final bool isEnabled;
  final MyBlocksState state;

  const _BlocksSection({
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

          return _QuestionCard(
            title: question.title ?? '',
            description: question.description ?? '',
            createdAt: question.createdAt,
            correctAnswers: 2,
            wrongAnswers: 2,
            difficulty: Difficulty.easy,
            onTap: () => context.push(
              AppRouter.blockDetailWithBlockId(question.id ?? -1),
            ),
          );
        }, childCount: state.myQuestions.length),
      ),
    );
  }
}

/// ---------------- My questions section ----------------
class _QuestionsSection extends StatelessWidget {
  final bool isEnabled;
  final MyQuestionsState state;

  const _QuestionsSection({
    super.key,
    required this.isEnabled,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SliverToBoxAdapter(child: SizedBox.shrink());

    /// loading state
    if (state.isLoading) return SliverToBoxAdapter(child: ProgressView());

    /// for active state
    return SliverMainAxisGroup(
      slivers: [
        SliverList.separated(
          itemCount: state.questions.length,
          itemBuilder: (_, index) {
            if (state.questions[index].id == -1) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: index == 0 ? 16 : 0,
                ),
                child: ListTile(
                  onTap: () => context.push(AppRouter.createQuestions),
                  tileColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Add question",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: index == 0 ? 16 : 0,
              ),
              child: ListTile(
                onTap: () => context.push(
                  AppRouter.questionDetailWithQuestionId(
                    state.questions[index].id,
                  ),
                ),
                tileColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  state.questions[index].testTitle ?? '',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  state.questions[index].testDescription ?? '',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                trailing: _DifficultyChip(
                  label: Difficulty.easy.name.toUpperCase(),
                  color: Difficulty.easy.color,
                ),
              ),
            );
          },
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

/// ---------------- My books section ----------------
class _BooksSection extends StatelessWidget {
  final bool isEnabled;

  const _BooksSection({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SliverToBoxAdapter(child: SizedBox.shrink());
    return SliverFillRemaining(child: Center(child: Text('My books')));
  }
}

class _BooksTab extends StatelessWidget {
  const _BooksTab();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (_, index) => _GridCard(title: "Book ${index + 1}"),
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

/// ---------- COMPONENTS ----------
class _GridCard extends StatelessWidget {
  final String title;

  const _GridCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

/// ---------- SUBHEADER ITEM ----------
class _SubheaderItem extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String value;
  final Widget leading;

  const _SubheaderItem({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.value,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              leading,
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// ----------- ITEMS -----------
class _QuestionCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? createdAt;
  final int? correctAnswers;
  final int? wrongAnswers;
  final Difficulty difficulty;
  final void Function()? onTap;

  const _QuestionCard({
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
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                  _QuestionStatItem(
                    icon: Icons.cancel_outlined,
                    value: wrongAnswers,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                formatDate(createdAt),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
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
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
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
