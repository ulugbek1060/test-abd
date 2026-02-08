import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/router/app_router.dart';

class BlockDetailScreen extends StatelessWidget {
  const BlockDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Algebra Basics"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          /// 🧪 TEST TITLE
          Text(
            "Test: Introduction to Algebra",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),

          const SizedBox(height: 6),

          /// 🧾 BLOCK DESCRIPTION
          Text(
            "This block focuses on solving algebraic expressions and equations. "
                "Practice each question to improve accuracy and speed.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 16),

          /// 🏷 CATEGORY + 👁 VISIBILITY
          Row(
            children: const [
              _InfoChip(
                icon: Icons.category_outlined,
                label: "Mathematics",
              ),
              SizedBox(width: 8),
              _InfoChip(
                icon: Icons.public,
                label: "Public",
                color: Colors.greenAccent,
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// 📝 QUESTIONS TITLE
          Text(
            "Questions",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),

          const SizedBox(height: 12),

          /// 🔲 QUESTIONS GRID
          _QuestionsGrid(),
        ],
      ),
    );
  }
}

/// 🔲 QUESTIONS GRID
class _QuestionsGrid extends StatelessWidget {
  final List<_QuestionItem> questions = const [
    _QuestionItem(level: QuestionLevel.easy, correct: 2, wrong: 0),
    _QuestionItem(level: QuestionLevel.medium, correct: 1, wrong: 1),
    _QuestionItem(level: QuestionLevel.hard, correct: 0, wrong: 2),
    _QuestionItem(level: QuestionLevel.easy, correct: 3, wrong: 0),
    _QuestionItem(level: QuestionLevel.medium, correct: 2, wrong: 1),
    _QuestionItem(level: QuestionLevel.hard, correct: 1, wrong: 3),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.35,
      ),
      itemBuilder: (context, index) {
        final q = questions[index];

        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
           context.push(AppRouter.myQuestionDetail);
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: scheme.surfaceVariant,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.outlineVariant.withOpacity(0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER: Question index + Level
                Row(
                  children: [
                    Text(
                      "Q${index + 1}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: scheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    _LevelBadge(level: q.level),
                  ],
                ),

                const Spacer(),

                /// STATS
                Row(
                  children: [
                    _StatItem(
                      icon: Icons.check_circle,
                      label: "${q.correct}",
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 12),
                    _StatItem(
                      icon: Icons.cancel,
                      label: "${q.wrong}",
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 🧠 QUESTION MODEL
class _QuestionItem {
  final QuestionLevel level;
  final int correct;
  final int wrong;

  const _QuestionItem({
    required this.level,
    required this.correct,
    required this.wrong,
  });
}

/// 🎯 LEVEL ENUM
enum QuestionLevel { easy, medium, hard }

/// 🏷 LEVEL BADGE
class _LevelBadge extends StatelessWidget {
  final QuestionLevel level;

  const _LevelBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color color;

    switch (level) {
      case QuestionLevel.easy:
        text = "Easy";
        color = Colors.greenAccent;
        break;
      case QuestionLevel.medium:
        text = "Medium";
        color = Colors.orangeAccent;
        break;
      case QuestionLevel.hard:
        text = "Hard";
        color = Colors.redAccent;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// ✔ / ❌ STAT ITEM
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/// 🏷 INFO CHIP
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: scheme.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color ?? scheme.onSurface),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: color ?? scheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
