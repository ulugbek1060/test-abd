import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/app_message_handler.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/features/home/home_cubit.dart';
import 'package:testabd/features/home/home_posts.dart';
import 'package:testabd/features/home/home_stories.dart';
import 'package:testabd/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeCubit>()..loadQuiz()),
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
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_shouldLoadNextPage()) {
      context.read<HomeCubit>().loadQuiz();
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
            StoriesWidget(),

            /// Posts Section
            PostsWidget(),
          ],
        ),
      ),
    );
  }
}
