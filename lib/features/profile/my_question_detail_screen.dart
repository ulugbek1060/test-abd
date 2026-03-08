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
import 'package:testabd/router/app_router.dart';

class MyQuestionDetailScreen extends StatelessWidget {
  final int? questionId;

  const MyQuestionDetailScreen({super.key, this.questionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<MyQuestionDetailCubit>(param1: questionId)..getQuestion(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyQuestionDetailCubit, MyQuestionDetailState>(
      builder: (context, state) {
        if (state.isLoading || state.question == null) {
          return const Scaffold(body: Center(child: ProgressView.medium()));
        }
        final q = state.question!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            titleSpacing: 16,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  q.testTitle ?? "Savol",
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  q.questionType?.getName(context) ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            actions: [
              if (q.id != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _FloatingEditButton(
                    onTap: () =>
                        context.push(AppRouter.createQuestionWithArgs(q.id)),
                  ),
                ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: _Header(
                    correct: q.correctCount ?? 0,
                    wrong: q.wrongCount ?? 0,
                    difficulty: q.difficultyPercentage?.toDifficulty(),
                    createdAt: q.createdAt,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: _QuestionAndAnswersCard(question: q),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          ),
        );
      },
    );
  }
}

// ── HEADER (difficulty + stats pills) ──────────────────────────────────────
class _Header extends StatelessWidget {
  final int correct;
  final int wrong;
  final Difficulty? difficulty;
  final DateTime? createdAt;

  const _Header({
    required this.correct,
    required this.wrong,
    this.difficulty,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (difficulty != null) _DifficultyPill(difficulty: difficulty!),
        _StatPill(label: "To'g'ri: $correct", color: const Color(0xFF34C759)),
        _StatPill(label: "Noto'g'ri: $wrong", color: const Color(0xFFFF3B30)),
      ],
    );
  }
}

class _DifficultyPill extends StatelessWidget {
  final Difficulty difficulty;

  const _DifficultyPill({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      decoration: BoxDecoration(
        color: difficulty.color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: difficulty.color.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            difficulty.name.toLowerCase() == "easy"
                ? Icons.emoji_emotions_outlined
                : difficulty.name.toLowerCase() == "medium"
                ? Icons.emoji_events_outlined
                : Icons.whatshot_rounded,
            size: 18,
            color: difficulty.color,
          ),
          const SizedBox(width: 8),
          Text(
            difficulty.name.toUpperCase(),
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w800,
              color: difficulty.color,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final Color color;

  const _StatPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: color.withOpacity(0.3), width: 1.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class _FloatingEditButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FloatingEditButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.edit_rounded,
            size: 22,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

// ── MAIN QUESTION + ANSWERS CARD ───────────────────────────────────────
class _QuestionAndAnswersCard extends StatelessWidget {
  final QuestionModel question;

  const _QuestionAndAnswersCard({required this.question});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.dark
                ? Colors.black.withOpacity(0.4)
                : Colors.black.withOpacity(0.1),
            blurRadius: 28,
            offset: const Offset(0, 12),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question text
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Text(
                question.questionText ?? '',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.32,
                  letterSpacing: -0.3,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            // Answers title
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text(
                "Javoblar",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),

            // Answers list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: _buildAnswers(context, question).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Bottom meta
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                children: [
                  if (question.createdAt != null)
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          formatDate(question.createdAt!),
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  const Spacer(),
                  Text(
                    "ID: ${question.id ?? '—'}",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnswers(BuildContext context, QuestionModel q) {
    final theme = Theme.of(context);
    final answers = q.answers ?? [];
    final type = q.questionType;

    if (type == null) return [];

    switch (type) {
      case QuestionType.singleSelect:
      case QuestionType.multipleSelect:
        return answers.mapIndexed((i, a) {
          final correct = a.isCorrect == true;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AnswerTile(
              letter: String.fromCharCode(65 + i),
              text: a.answerText ?? '',
              isCorrect: correct,
              isMulti: type == QuestionType.multipleSelect,
            ),
          );
        }).toList();

      case QuestionType.trueFalse:
        return answers.mapIndexed((i, a) {
          final correct = a.isCorrect == true;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AnswerTile(
              letter: i == 0 ? "To'g'ri" : "Noto'g'ri",
              text: a.answerText ?? (i == 0 ? "To'g'ri" : "Noto'g'ri"),
              isCorrect: correct,
              useIcon: true,
              icon: i == 0 ? Icons.check_circle_rounded : Icons.cancel_rounded,
              iconColor: i == 0 ? Colors.green : Colors.red,
            ),
          );
        }).toList();

      case QuestionType.textQuestion:
        return [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "To'g'ri javob: ${q.answers.firstOrNull?.answerText ?? '—'}",
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
            ),
          ),
        ];

      default:
        return [];
    }
  }
}

class _AnswerTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool isCorrect;
  final bool isMulti;
  final bool useIcon;
  final IconData? icon;
  final Color? iconColor;

  const _AnswerTile({
    required this.letter,
    required this.text,
    required this.isCorrect,
    this.isMulti = false,
    this.useIcon = false,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: isCorrect
            ? theme.colorScheme.primary.withOpacity(0.11)
            : theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCorrect
              ? theme.colorScheme.primary.withOpacity(0.55)
              : Colors.transparent,
          width: 1.6,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge / Icon
          if (useIcon)
            Icon(icon, size: 36, color: iconColor ?? theme.colorScheme.primary)
          else
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCorrect
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline.withOpacity(0.3),
              ),
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: isCorrect ? Colors.white : theme.colorScheme.onSurface,
                ),
              ),
            ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              text,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: isCorrect ? FontWeight.w600 : FontWeight.w500,
                color: isCorrect
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
                height: 1.38,
              ),
            ),
          ),

          if (isCorrect)
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Icon(
                isMulti ? Icons.check_circle_rounded : Icons.star_rounded,
                color: isMulti ? Colors.green : Colors.amber,
                size: 26,
              ),
            ),
        ],
      ),
    );
  }
}
