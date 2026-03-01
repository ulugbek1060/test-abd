import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/my_question_detail_cubit.dart';
import 'package:testabd/features/profile/my_question_detail_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class MyQuestionDetailScreen extends StatelessWidget {
  final int? questionId;

  const MyQuestionDetailScreen({super.key, this.questionId});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<MyQuestionDetailCubit>(param1: questionId)..fetchQuestion(),
    child: const _View(),
  );
}

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyQuestionDetailCubit, MyQuestionDetailState>(
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
                  onPressed: () => context.push(
                    AppRouter.createQuestionWithArgs(state.question?.id),
                  ),
                  icon: Icon(Icons.mode_edit_rounded, size: 20),
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
                        difficultyPercentage:
                            state.question?.difficultyPercentage,
                        createdAt: state.question?.createdAt,
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

// class _Header extends StatelessWidget {
//   final String correctCount;
//   final String wrongCount;
//
//   const _Header({required this.correctCount, required this.wrongCount});
//
//   @override
//   Widget build(BuildContext context) => Row(
//     children: [
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: Colors.blue.withAlpha(50),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           "Correct count: $correctCount",
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       const SizedBox(width: 8),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//         decoration: BoxDecoration(
//           color: Colors.red.withAlpha(50),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           "Wrong count: $wrongCount",
//           style: TextStyle(
//             color: Colors.red,
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     ],
//   );
// }


class _Header extends StatelessWidget {
  final String correctCount;
  final String wrongCount;
  final double? difficultyPercentage;
  final DateTime? createdAt;

  const _Header({
    super.key,
    required this.correctCount,
    required this.wrongCount,
    this.difficultyPercentage,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        // Correct
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.withAlpha(50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${context.l10n.correctCount}: $correctCount",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Wrong
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.red.withAlpha(50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${context.l10n.wrongCount}: $wrongCount",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Difficulty % (modern colored badge)
        if (difficultyPercentage != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: difficultyPercentage?.toDifficulty().color.withAlpha(50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              difficultyPercentage?.toDifficulty().name.toUpperCase() ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: difficultyPercentage?.toDifficulty().color,
              ),
            ),
          ),

        // Created At
        if (createdAt != null)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  formatDate(createdAt),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final QuestionModel? question;

  const _QuestionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question?.questionText ?? "",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Choose the correct statements about Java programming language.",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // answer section
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Answers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),

            ...answers(context),
          ],
        ),
      ],
    );
  }

  Iterable<Widget> answers(BuildContext context) {
    switch (question?.questionType) {
      case QuestionType.singleSelect:
        return _singleSelectAnswer(context);
      case QuestionType.multipleSelect:
        return _multiSelectAnswer(context);
      case QuestionType.trueFalse:
        return _trueFalseAnswer(context);
      case QuestionType.textQuestion:
        return [];
      default:
        return [];
    }
  }

  Iterable<Widget> _singleSelectAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: e.isCorrect
                ? Colors.blue.withAlpha(20)
                : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: e.isCorrect ? Colors.blue : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: e.isCorrect ? Colors.blue : Colors.grey.shade800,
                ),
                child: Text(
                  String.fromCharCode(65 + i), // A, B, C, D
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  e.answerText ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      }) ??
      [];

  Iterable<Widget> _trueFalseAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: e.isCorrect
                ? Colors.blue.withAlpha(20)
                : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: e.isCorrect ? Colors.blue : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                i == 0 ? Icons.check_circle : Icons.cancel,
                color: i == 0 ? Colors.green : Colors.red,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  e.answerText ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      }) ??
      [];

  Iterable<Widget> _multiSelectAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: e.isCorrect
                ? Colors.blue.withAlpha(20)
                : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: e.isCorrect ? Colors.blue : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(value: e.isCorrect, onChanged: null),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  e.answerText ?? "",
                  // "klasdmklasmdakslndaksndjkasdnakjdnsakjdnaskjdnaskjdnaskjdnsakjdnsakjdnsakdnjkas",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      }) ??
      [];
}
