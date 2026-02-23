import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/theme/app_colors.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/users/user_question_detail_cubit.dart';
import 'package:testabd/features/users/user_question_detail_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';

class UserQuestionDetailScreen extends StatelessWidget {
  final int? questionId;

  const UserQuestionDetailScreen({super.key, this.questionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<UserQuestionDetailCubit>(param1: questionId)..fetchQuestion(),
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserQuestionDetailCubit, UserQuestionDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.question?.testTitle ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  state.question?.questionType?.getName(context) ?? "",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            actions: [
              if (state.question?.id != null)
                IconButton(
                  onPressed: context
                      .read<UserQuestionDetailCubit>()
                      .toggleBookmark,
                  icon: state.bookmarksState.isLoading
                      ? ProgressView()
                      : Icon(
                          (state.question?.isBookmarked ?? false)
                              ? Icons.bookmark
                              : Icons.bookmark_border_rounded,
                          size: 20,
                        ),
                ),
            ],
          ),
          body: state.isLoading
              ? ProgressView()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Header(
                        correctCount:
                            state.question?.correctCount?.toString() ?? "",
                        wrongCount:
                            state.question?.wrongCount?.toString() ?? "",
                      ),
                      const SizedBox(height: 20),

                      _QuestionCard(question: state.question),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final String correctCount;
  final String wrongCount;

  const _Header({required this.correctCount, required this.wrongCount});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha(50),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "${context.l10n.correctCount}: $correctCount",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(width: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(50),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "${context.l10n.wrongCount}: $wrongCount",
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

class _QuestionCard extends StatelessWidget {
  final QuestionModel? question;

  const _QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    if (question == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuestionHeader(context),
        const SizedBox(height: 24),
        _buildAnswersSection(context),
      ],
    );
  }

  // ================= QUESTION HEADER =================

  Widget _buildQuestionHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.onSurfaceColor(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question?.questionText ?? "",
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.l10n.chooseCorrectStatementsBelow,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  // ================= ANSWERS SECTION =================
  Widget _buildAnswersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.answers,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        ..._buildAnswers(context),
      ],
    );
  }

  List<Widget> _buildAnswers(BuildContext context) {
    switch (question?.questionType) {
      case QuestionType.singleSelect:
        return _singleSelect(context);
      case QuestionType.multipleSelect:
        return _multiSelect(context);
      case QuestionType.trueFalse:
        return _trueFalse(context);
      default:
        return [];
    }
  }

  // ================= SINGLE SELECT =================

  List<Widget> _singleSelect(BuildContext context) {
    return question?.answers.map((answer) {
          final isSelected = question?.myAnswersId.contains(answer.id) ?? false;

          return _AnswerContainer(
            isSelected: isSelected,
            isCorrect: answer.isCorrect,
            onTap: () => context.read<UserQuestionDetailCubit>().selectAnswer({
              answer.id ?? -1,
            }),
            leading: _buildSingleLeading(answer, isSelected),
            text: answer.answerText ?? "",
          );
        }).toList() ??
        [];
  }

  Widget _buildSingleLeading(AnswerItemModel answer, bool isSelected) {
    final backgroundColor = isSelected
        ? (answer.isCorrect ? Colors.green : Colors.red)
        : Colors.grey.shade800;

    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: answer.isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : isSelected
          ? Icon(
              answer.isCorrect ? Icons.check : Icons.close,
              color: Colors.white,
              size: 18,
            )
          : Text(
              answer.letter ?? "",
              style: const TextStyle(color: Colors.white),
            ),
    );
  }

  // ================= MULTI SELECT =================

  List<Widget> _multiSelect(BuildContext context) {
    return question?.answers.map((answer) {
          final isSelected = question?.myAnswersId.contains(answer.id) ?? false;

          return _AnswerContainer(
            isSelected: isSelected,
            isCorrect: answer.isCorrect,
            onTap: () => context
                .read<UserQuestionDetailCubit>()
                .selectMultipleAnswers(answer.id),
            leading: Checkbox(
              value: isSelected,
              onChanged: (_) => context
                  .read<UserQuestionDetailCubit>()
                  .selectMultipleAnswers(answer.id),
            ),
            text: answer.answerText ?? "",
          );
        }).toList() ??
        [];
  }

  // ================= TRUE / FALSE =================

  List<Widget> _trueFalse(BuildContext context) {
    return question?.answers.asMap().entries.map((entry) {
          final index = entry.key;
          final answer = entry.value;

          return _AnswerContainer(
            isSelected: question?.myAnswersId.contains(answer.id) ?? false,
            isCorrect: answer.isCorrect,
            onTap: () => context.read<UserQuestionDetailCubit>().selectAnswer({
              answer.id ?? -1,
            }),
            leading: Icon(
              index == 0 ? Icons.check_circle : Icons.cancel,
              color: index == 0 ? Colors.green : Colors.red,
              size: 28,
            ),
            text: answer.answerText ?? "",
          );
        }).toList() ??
        [];
  }
}

// ================= REUSABLE ANSWER CONTAINER =================

class _AnswerContainer extends StatelessWidget {
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;
  final Widget leading;
  final String text;

  const _AnswerContainer({
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
    required this.leading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected
        ? (isCorrect ? Colors.green : Colors.red)
        : Colors.grey.shade800;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
