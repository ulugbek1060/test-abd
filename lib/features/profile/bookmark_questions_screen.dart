import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/bookmark_questions_cubit.dart';
import 'package:testabd/features/profile/bookmark_questions_state.dart';
import 'package:testabd/features/users/user_profile_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/main.dart';
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
    return RefreshIndicator(
      onRefresh: context.read<BookmarkQuestionsCubit>().refresh,
      child: Scaffold(
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
            onTap: () => context.push(
              AppRouter.bookMarkQuestionDetailWithArgs(questionId: question.id),
            ),
            isFirst: index == 0,
            isLast: index == state.questions.length - 1,
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     QUESTION ITEM CARD
// ─────────────────────────────────────────────────────────────
class _QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final VoidCallback onTap;
  final bool isLast;
  final bool isFirst;

  const _QuestionCard({
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
