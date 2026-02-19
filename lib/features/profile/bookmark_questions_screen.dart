import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/features/profile/bookmark_questions_cubit.dart';
import 'package:testabd/features/profile/bookmark_questions_state.dart';
import 'package:testabd/router/app_router.dart';

class BookmarkQuestionsScreen extends StatelessWidget {
  const BookmarkQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<BookmarkQuestionsCubit>()..fetchQuestionsBookmarks(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkQuestionsCubit, BookmarkQuestionsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Bookmark Questions')),
          body: CustomScrollView(slivers: [_QuestionsSection(state: state)]),
        );
      },
    );
  }
}

class _QuestionsSection extends StatelessWidget {
  final BookmarkQuestionsState state;

  const _QuestionsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
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
          final question = state.bookmarkQuestions.results[index];
          return QuestionCard(
            title: question.questionDetail?.testTitle ?? '',
            description: question.questionDetail?.questionText ?? '',
            createdAt: question.createdAt,
            correctAnswers: 2,
            wrongAnswers: 2,
            difficulty: Difficulty.easy,
            onTap: () => context.push(
              AppRouter.userQuestionDetailWithBlockId(question.id ?? -1),
            ),
          );
        }, childCount: state.bookmarkQuestions.results.length),
      ),
    );
  }
}

// -------------------- Components ---------------------
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
