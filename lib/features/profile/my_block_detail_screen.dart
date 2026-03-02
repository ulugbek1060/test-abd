import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/core/enums/difficulty.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/di/app_config.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/profile/my_block_detail_cubit.dart';
import 'package:testabd/features/profile/my_block_detail_state.dart';
import 'package:testabd/l10n/l10n_extension.dart';
import 'package:testabd/router/app_router.dart';

class MyBlockDetailScreen extends StatelessWidget {
  final int blockId;

  const MyBlockDetailScreen({super.key, required this.blockId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MyBlockDetailCubit>(param1: blockId),
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
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    // Standard initialization
    _scrollController = ScrollController()..addListener(_onScrollChanged);
    BlocProvider.of<MyBlockDetailCubit>(context).fetchBlock();
  }

  void _onScrollChanged() {
    if (!_scrollController.hasClients) return;
    final double offset = _scrollController.offset;
    // Calculate what opacity WOULD be
    const double threshold = 180.0;
    final double newOpacity = (offset / threshold).clamp(0.0, 1.0);
    final double currentOpacity = (_scrollOffset / threshold).clamp(0.0, 1.0);

    // ONLY update if:
    // 1. Opacity changes by more than 3% (eliminates tiny fluctuations)
    // 2. User is returning to top (special handling for bounce/overscroll)
    // 3. User is near bottom
    if ((newOpacity - currentOpacity).abs() > 0.03 ||
        (offset < 15 && _scrollOffset > 20) || // returning to top
        (offset > threshold - 20 && _scrollOffset < threshold - 40)) {
      setState(() {
        _scrollOffset = offset;
      });
    }
  }

  Color _getAppBarBackground() {
    if (!_scrollController.hasClients) return Colors.transparent;
    const double threshold = 180.0;
    // Force fully transparent when very close to top (no edge flicker)
    if (_scrollOffset < 12) {
      return Colors.transparent;
    }
    final double opacity = (_scrollOffset / threshold).clamp(0.0, 1.0);
    return Theme.of(context).scaffoldBackgroundColor.withOpacity(opacity);
  }

  @override
  void dispose() {
    // IMPORTANT: Always dispose the controller to avoid memory leaks
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBlockDetailCubit, MyBlockDetailState>(
      builder: (context, state) {
        final block = state.blockDetail;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: _getAppBarBackground(),
            elevation: 0,
            title: Text(
              block?.title ?? "Detail",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () =>
                    context.push(AppRouter.createBlockWithArg(block?.id)),
                icon: const Icon(Icons.edit_rounded, size: 26),
              ),
            ],
          ),
          body: state.isLoading
              ? const ProgressView()
              : CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // ── ULTRA PREMIUM GRADIENT HEADER ──
                    _Header(
                      title: block?.title ?? "",
                      description: block?.description ?? "",
                      category: block?.category?.title ?? "",
                      visibility: block?.visibility ?? AccessType.unlisted,
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 20)),

                    // ── STATS ROW (Instagram highlight style) ──
                    _SubHeader(
                      participants: block?.participantCount ?? 0,
                      totalQuestions: block?.questions.length ?? 0,
                      avgSolves: block?.difficultyPercentage ?? 0,
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 28)),

                    // List header
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Questions",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.3,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "${block?.questions.length ?? 0} total",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 12)),

                    // Beautiful question list
                    SliverList.builder(
                      itemCount: block?.questions.length ?? 0,
                      itemBuilder: (context, index) {
                        final q = block!.questions[index];
                        return _QuestionCard(
                          question: q,
                          isFirst: index == 0,
                          isLast: index == (block.questions.length - 1),
                        );
                      },
                    ),

                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // TODO: Start block / quiz
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Starting block... 🔥"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            label: const Text(
              "Start Block",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            icon: const Icon(Icons.play_arrow_rounded, size: 28),
            backgroundColor: const Color(0xFFE1306C),
            foregroundColor: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM HEADER
// ─────────────────────────────────────────────────────────────
class _Header extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final AccessType visibility;

  const _Header({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.visibility,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPublic = visibility == AccessType.public;

    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 40),
        // extra top padding for status bar
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1306C), Color(0xFF405DE6), Color(0xFF833AB4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category + Visibility pills
            Row(
              children: [
                // Category
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.category_rounded,
                        color: Colors.white,
                        size: 19,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Visibility
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isPublic ? Icons.public_rounded : Icons.lock_rounded,
                        color: Colors.white,
                        size: 19,
                      ),
                      const SizedBox(width: 9),
                      Text(
                        visibility.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Title with subtle shadow
            Text(
              title,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.05,
                letterSpacing: -0.8,
                shadows: [
                  Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 8,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.5,
                height: 1.45,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM STATS ROW
// ─────────────────────────────────────────────────────────────
class _SubHeader extends StatelessWidget {
  final int totalQuestions;
  final int participants;
  final double avgSolves;

  const _SubHeader({
    super.key,
    required this.totalQuestions,
    required this.participants,
    required this.avgSolves,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            _buildStatCard(
              context: context,
              icon: Icons.quiz_rounded,
              value: totalQuestions.toString(),
              label: context.l10n.questions,
              color: const Color(0xFF405DE6),
              accent: const Color(0xFF405DE6).withOpacity(0.1),
            ),
            const SizedBox(width: 14),
            _buildStatCard(
              context: context,
              icon: Icons.people_alt_rounded,
              value: participants.toString(),
              label: "Participants",
              color: const Color(0xFF34C759),
              accent: const Color(0xFF34C759).withOpacity(0.1),
            ),
            const SizedBox(width: 14),
            _buildStatCard(
              context: context,
              icon: Icons.emoji_events_rounded,
              value: "${avgSolves.toStringAsFixed(1)}%",
              label: "Avg Solve",
              color: const Color(0xFFFF9500),
              accent: const Color(0xFFFF9500).withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    required Color accent,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
                height: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                     PREMIUM QUESTION ITEM
// ─────────────────────────────────────────────────────────────
class _QuestionCard extends StatelessWidget {
  final QuestionModel? question;
  final bool isFirst;
  final bool isLast;

  const _QuestionCard({
    super.key,
    this.question,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final difficulty = question?.difficultyPercentage.toDifficulty();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 24 : 20,
        left: 16,
        right: 16,
        top: isFirst ? 16 : 0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── PREMIUM HEADER ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
              child: Row(
                children: [
                  // Difficulty pill (Instagram story style)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: difficulty?.color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:
                            difficulty?.color.withOpacity(0.3) ??
                            Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          difficulty?.name.toLowerCase() == "easy"
                              ? Icons.emoji_emotions_outlined
                              : difficulty?.name.toLowerCase() == "medium"
                              ? Icons.emoji_events_outlined
                              : Icons.whatshot,
                          size: 18,
                          color: difficulty?.color,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (difficulty?.name ?? "").toUpperCase(),
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: difficulty?.color,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Solved stats (modern pill)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF34C759),
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${question?.correctCount ?? 0}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF34C759),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Icon(
                          Icons.cancel,
                          color: Color(0xFFFF3B30),
                          size: 19,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${question?.wrongCount ?? 0}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF3B30),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Edit button (floating Instagram style)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => context.push(
                        AppRouter.createQuestionWithArgs(question?.id),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit_rounded,
                          size: 22,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Question text (big & elegant)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                question?.questionText ?? "",
                style: TextStyle(
                  fontSize: 21,
                  height: 1.38,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                  letterSpacing: -0.2,
                ),
              ),
            ),

            // Answers section
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                "Answers",
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  letterSpacing: 0.3,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: answers(context).toList()),
            ),

            // Bottom bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                children: [
                  Text(
                    formatDate(question?.createdAt) ?? "Just now",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  // Tiny "view only" hint or whatever you want
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Tap edit to modify",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
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

  // ── ANSWERS RENDERING (enhanced UI) ──
  Iterable<Widget> answers(BuildContext context) {
    switch (question?.questionType) {
      case QuestionType.singleSelect:
        return _singleSelectAnswer(context);
      case QuestionType.multipleSelect:
        return _multiSelectAnswer(context);
      case QuestionType.trueFalse:
        return _trueFalseAnswer(context);
      case QuestionType.textQuestion:
        return [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceVariant.withOpacity(0.6),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              "Text answer: ${question?.answers.firstOrNull?.answerText ?? '—'}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ];
      default:
        return [];
    }
  }

  Iterable<Widget> _singleSelectAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        final bool correct = e.isCorrect;
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: correct
                ? const Color(0xFF34C759).withOpacity(0.08)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: correct ? const Color(0xFF34C759) : Colors.transparent,
              width: 2,
            ),
            boxShadow: correct
                ? [
                    BoxShadow(
                      color: const Color(0xFF34C759).withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: correct
                      ? const Color(0xFF34C759)
                      : Colors.grey.shade300,
                ),
                child: Text(
                  String.fromCharCode(65 + i),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: correct ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  e.answerText ?? "",
                  style: TextStyle(
                    fontSize: 16.5,
                    height: 1.4,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: correct ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
              if (correct)
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFF34C759),
                  size: 26,
                ),
            ],
          ),
        );
      }) ??
      [];

  Iterable<Widget> _trueFalseAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        final bool isTrue = i == 0;
        final bool correct = e.isCorrect;
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: correct
                ? const Color(0xFF34C759).withOpacity(0.08)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: correct ? const Color(0xFF34C759) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isTrue ? Icons.check_circle : Icons.cancel,
                size: 34,
                color: correct
                    ? const Color(0xFF34C759)
                    : (isTrue ? Colors.green : Colors.red),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  e.answerText ?? (isTrue ? "True" : "False"),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              if (correct)
                const Icon(Icons.star_rounded, color: Colors.amber, size: 26),
            ],
          ),
        );
      }) ??
      [];

  Iterable<Widget> _multiSelectAnswer(BuildContext context) =>
      question?.answers.mapIndexed((i, e) {
        final bool correct = e.isCorrect;
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: correct
                ? const Color(0xFF34C759).withOpacity(0.08)
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: correct ? const Color(0xFF34C759) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Checkbox(
                  value: correct,
                  onChanged: null,
                  activeColor: const Color(0xFF34C759),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  e.answerText ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.5,
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
