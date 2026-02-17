import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/my_question_detail_cubit.dart';
import 'package:testabd/features/profile/my_question_detail_state.dart';
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
              children: const [
                Text(
                  "Java Basics Test",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 2),
                Text(
                  "Block 1: Introduction",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(
                  correctCount: state.question?.correctCount?.toString() ?? "",
                  wrongCount: state.question?.wrongCount?.toString() ?? "",
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

  const _Header({
    super.key,
    required this.correctCount,
    required this.wrongCount,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          correctCount,
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
          color: Colors.red.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          wrongCount,
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
        ListView(
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

            ...question?.answers.mapIndexed((i, e) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: e.isCorrect
                            ? Colors.blue.withOpacity(0.2)
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
                              color: e.isCorrect
                                  ? Colors.blue
                                  : Colors.grey.shade800,
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
                    ),
                  );
                }) ??
                [],
          ],
        ),
      ],
    );
  }
}
