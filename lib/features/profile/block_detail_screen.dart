import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/block_detail_cubit.dart';
import 'package:testabd/features/profile/block_detail_state.dart';
import 'package:testabd/router/app_router.dart';

class BlockDetailScreen extends StatelessWidget {
  final int blockId;

  const BlockDetailScreen({super.key, required this.blockId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BlockDetailCubit>(param1: blockId),
      child: const _View(),
    );
  }
}

class _View extends StatefulWidget {
  const _View({super.key});

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  @override
  void initState() {
    BlocProvider.of<BlockDetailCubit>(context).fetchBlock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocBuilder<BlockDetailCubit, BlockDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.blockDetail?.title ?? "Detail"),
            centerTitle: true,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
          ),
          body: state.isLoading
              ? ProgressView()
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  children: [
                    /// 🧪 TEST TITLE
                    Text(
                      state.blockDetail?.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: scheme.onSurface,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// 🧾 BLOCK DESCRIPTION
                    Text(
                      state.blockDetail?.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// 🏷 CATEGORY + 👁 VISIBILITY
                    Row(
                      children: [
                        _InfoChip(
                          icon: Icons.category_outlined,
                          label: state.blockDetail?.category?.title ?? "",
                        ),
                        SizedBox(width: 8),
                        _InfoChip(
                          icon:
                              state.blockDetail?.visibility?.getIconData() ??
                              Icons.lock,
                          label: state.blockDetail?.visibility?.name ?? "",
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
                    _QuestionsGrid(
                      questions: state.blockDetail?.questions ?? [],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

/// 🔲 QUESTIONS GRID
class _QuestionsGrid extends StatelessWidget {
  final List<QuestionModel> questions;

  const _QuestionsGrid({required this.questions});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (questions.isEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(child: Icon(Icons.hourglass_empty)),
      );
    }

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
              border: Border.all(color: scheme.outlineVariant.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER: Question index + Level
                Row(
                  children: [
                    Text(
                      q.testTitle ?? "",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: scheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    _LevelBadge(level: Difficulty.easy),
                  ],
                ),

                const Spacer(),

                /// STATS
                Row(
                  children: [
                    _StatItem(
                      icon: Icons.check_circle,
                      label: "${q.correctCount}",
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(width: 12),
                    _StatItem(
                      icon: Icons.cancel,
                      label: "${q.wrongCount}",
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

/// 🏷 LEVEL BADGE
class _LevelBadge extends StatelessWidget {
  final Difficulty level;

  const _LevelBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: level.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        level.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
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

  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: scheme.outlineVariant.withOpacity(0.3)),
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
