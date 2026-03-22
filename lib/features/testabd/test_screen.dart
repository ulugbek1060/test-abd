import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class QuestionsSwipeScreen extends StatefulWidget {
  const QuestionsSwipeScreen({super.key});

  @override
  State<QuestionsSwipeScreen> createState() => _QuestionsSwipeScreenState();
}

class _QuestionsSwipeScreenState extends State<QuestionsSwipeScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  List<QuestionModel> questions = [
    QuestionModel(
      id: 1,
      test: 1,
      testTitle: 'Test 1',
      questionText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      questionType: QuestionType.multipleSelect,
      orderIndex: 1,
      media: 'https://example.com/image.jpg',
      answers: [
        AnswerItemModel(
          id: 1,
          letter: 'A',
          answerText: 'Answer 1',
          isCorrect: true,
        ),
        AnswerItemModel(
          id: 2,
          letter: 'B',
          answerText: 'Answer 2',
          isCorrect: false,
        ),
        AnswerItemModel(
          id: 3,
          letter: 'C',
          answerText: 'Answer 3',
          isCorrect: false,
        ),
      ],
      testDescription: 'Test description',
      correctAnswerText: 'Answer 1',
      answerLanguage: 'en',
      correctCount: 10,
      wrongCount: 5,
      difficultyPercentage: 0.7,
      userAttemptCount: 20,
      user: UserItemModel(
        id: 1,
        username: 'user1',
        profileImage: 'https://example.com/profile.jpg',
        isBadged: true,
        isFollowing: false,
        isPremium: true,
      ),
      createdAt: DateTime.now(),
      roundImage: 'https://example.com/round.jpg',
      isBookmarked: true,
      category: CategoryModel(
        id: 1,
        totalTests: 10,
        totalQuestions: 20,
        title: 'Category 1',
        slug: 'category-1',
        description: 'Description 1',
        emoji: '📚',
        image: 'https://example.com/category1.jpg',
      ),
      isBookmarkLoading: false,
      isLoading: false,
      isCompleted: true,
      isCorrect: true,
      myAnswersId: {1, 2},
    ),
    QuestionModel(
      id: 2,
      test: 2,
      testTitle: 'Test 2',
      questionText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      questionType: QuestionType.trueFalse,
      orderIndex: 2,
      media: 'https://example.com/image2.jpg',
      answers: [
        AnswerItemModel(
          id: 4,
          letter: 'A',
          answerText: 'True',
          isCorrect: true,
        ),
        AnswerItemModel(
          id: 5,
          letter: 'B',
          answerText: 'False',
          isCorrect: false,
        ),
      ],
      testDescription: 'Test description 2',
      correctAnswerText: 'True',
      answerLanguage: 'en',
      correctCount: 15,
      wrongCount: 8,
      difficultyPercentage: 0.3,
      userAttemptCount: 15,
      user: UserItemModel(
        id: 2,
        username: 'user2',
        profileImage: 'https://example.com/profile2.jpg',
        isBadged: false,
        isFollowing: true,
        isPremium: false,
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      roundImage: 'https://example.com/round2.jpg',
      isBookmarked: false,
      category: CategoryModel(
        id: 2,
        totalTests: 20,
        totalQuestions: 20,
        title: 'Category 2',
        slug: 'category-2',
        description: 'Description 2',
        emoji: '📚',
        image: 'https://example.com/category2.jpg',
      ),
      isBookmarkLoading: false,
      isLoading: false,
      isCompleted: false,
      isCorrect: false,
      myAnswersId: {4},
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: questions.length,
        // onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          final quiz = questions[index];
          return QuestionCardFullScreen(quiz: quiz);
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//               FULL-SCREEN QUESTION CARD
// ─────────────────────────────────────────────────────────────
class QuestionCardFullScreen extends StatelessWidget {
  final QuestionModel quiz;

  const QuestionCardFullScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        CachedNetworkImage(
          imageUrl: quiz.roundImage ?? '',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          placeholder: (context, url) => Container(color: Colors.black87),
          errorWidget: (context, url, error) => Container(
            color: Colors.black54,
            child: const Icon(
              Icons.broken_image_rounded,
              color: Colors.white38,
              size: 64,
            ),
          ),
        ),

        // Deep immersive gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.06),
                Colors.black.withOpacity(0.35),
                Colors.black.withOpacity(0.78),
                Colors.black.withOpacity(0.97),
              ],
              stops: const [0.0, 0.28, 0.68, 1.0],
            ),
          ),
        ),

        // Main content
        SafeArea(
          child: Column(
            children: [
              // Header — floating style
              _ModernHeader(quiz: quiz),

              // Question + Answers — centered
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quiz.questionText ?? '',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                height: 1.32,
                                letterSpacing: -0.5,
                              ),
                        ),

                        const SizedBox(height: 30),

                        _AnswersList(
                          questionId: quiz.id,
                          answers: quiz.answers,
                          questionType: quiz.questionType,
                          myAnswersId: quiz.myAnswersId,
                          isCompleted: quiz.isCompleted,
                          isLoading: quiz.isLoading,
                        ),

                        const SizedBox(
                          width: double.infinity,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bottom floating blurred bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _ModernBottomBar(quiz: quiz),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                        HEADER
// ─────────────────────────────────────────────────────────────
class _ModernHeader extends StatelessWidget {
  final QuestionModel quiz;

  const _ModernHeader({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  _HeaderUserImage(
                    imageUrl: quiz.user?.profileImage,
                    username: quiz.user?.username ?? '',
                    size: 52,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize(quiz.user?.username ?? ''),
                          style: const TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            shadows: [
                              Shadow(blurRadius: 8, color: Colors.black54),
                            ],
                          ),
                        ),
                        Text(
                          formatDate(quiz.createdAt),
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (!(quiz.user?.isFollowing ?? false))
            OutlinedButton(
              onPressed: quiz.user?.isFollowInLoading ?? false ? null : () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white70, width: 1.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                backgroundColor: Colors.white.withOpacity(0.08),
              ),
              child: quiz.user?.isFollowInLoading ?? false
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    )
                  : const Text(
                      'Follow',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
            ),
        ],
      ),
    );
  }
}

class _HeaderUserImage extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final double size;

  const _HeaderUserImage({
    this.imageUrl,
    required this.username,
    this.size = 52.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white70, width: 2.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          fit: BoxFit.cover,
          placeholder: (_, __) => Image.asset(
            'assets/images/default_avatar.png',
            fit: BoxFit.cover,
          ),
          errorWidget: (_, __, ___) => Image.asset(
            'assets/images/default_avatar.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                    ANSWERS LIST & TILES
// ─────────────────────────────────────────────────────────────
class _AnswersList extends StatelessWidget {
  final int? questionId;
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final QuestionType? questionType;
  final bool isCompleted;
  final bool isLoading;

  const _AnswersList({
    required this.questionId,
    required this.answers,
    required this.myAnswersId,
    required this.questionType,
    required this.isCompleted,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    switch (questionType) {
      case QuestionType.multipleSelect:
        return MultipleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onItemTap: (id) {},
          onSubmitTap: (ids) {},
        );

      case QuestionType.singleSelect:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (id) {},
        );

      case QuestionType.trueFalse:
        return TrueFalseAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (id) {},
        );

      case QuestionType.textQuestion:
        return const Center(
          child: Text(
            "Text answer coming soon...",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
        );

      default:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onSubmitTap: (id) {},
        );
    }
  }
}

// ─────────────────────────────────────────────────────────────
//                   GLASSMORPHIC ANSWER TILE
// ─────────────────────────────────────────────────────────────
class _GlassAnswerTile extends StatelessWidget {
  final String letter;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isCompleted;
  final bool isLoading;
  final VoidCallback? onTap;
  final bool showCheckbox;

  const _GlassAnswerTile({
    super.key,
    required this.letter,
    required this.text,
    this.isSelected = false,
    this.isCorrect = false,
    this.isCompleted = false,
    this.isLoading = false,
    this.onTap,
    this.showCheckbox = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isCompleted
        ? (isSelected
              ? (isCorrect
                    ? Colors.greenAccent.shade400
                    : Colors.redAccent.shade400)
              : (isCorrect
                    ? Colors.greenAccent.withOpacity(0.6)
                    : Colors.white.withOpacity(0.25)))
        : (isSelected ? Colors.greenAccent : Colors.white.withOpacity(0.35));

    final bgColor = isCompleted
        ? (isSelected
              ? Colors.green.withOpacity(0.18)
              : (isCorrect
                    ? Colors.green.withOpacity(0.09)
                    : Colors.white.withOpacity(0.07)))
        : (isSelected
              ? Colors.green.withOpacity(0.14)
              : Colors.white.withOpacity(0.08));

    return GestureDetector(
      onTap: isCompleted ? null : onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: borderColor,
                width: isSelected || (isCompleted && isCorrect) ? 1 : 1.4,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.14),
                    border: Border.all(
                      color: borderColor.withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                  child: isLoading
                      ? ProgressView.small()
                      : Center(
                          child: Text(
                            letter,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: isSelected || (isCompleted && isCorrect)
                          ? FontWeight.w800
                          : FontWeight.w600,
                      height: 1.38,
                    ),
                  ),
                ),
                if (showCheckbox && !isCompleted)
                  Checkbox(
                    value: isSelected,
                    onChanged: (_) => onTap?.call(),
                    activeColor: Colors.greenAccent.shade400,
                    checkColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.white70, width: 1.8),
                  )
                else if (isCompleted && (isSelected || isCorrect))
                  Icon(
                    isCorrect
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    color: isCorrect
                        ? Colors.greenAccent.shade400
                        : Colors.redAccent.shade400,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                      ANSWER CARDS
// ─────────────────────────────────────────────────────────────
class MultipleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int answerId) onItemTap;
  final void Function(Set<int> answers) onSubmitTap;

  const MultipleAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.isLoading,
    required this.onItemTap,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...answers.asMap().entries.map((e) {
          final idx = e.key;
          final ans = e.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _GlassAnswerTile(
              letter: String.fromCharCode(65 + idx),
              text: ans.answerText ?? '',
              isSelected: myAnswersId.contains(ans.id),
              isCorrect: ans.isCorrect,
              isCompleted: isCompleted,
              isLoading: isLoading,
              onTap: () => onItemTap(ans.id!),
              showCheckbox: true,
            ),
          );
        }),

        if (!isCompleted)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: myAnswersId.isNotEmpty && !isLoading
                    ? () => onSubmitTap(myAnswersId)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit Answers"),
              ),
            ),
          ),
      ],
    );
  }
}

class SingleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int? answerId) onSubmitTap;

  const SingleAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.isLoading,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: answers.asMap().entries.map((e) {
        final idx = e.key;
        final ans = e.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _GlassAnswerTile(
            letter: String.fromCharCode(65 + idx),
            text: ans.answerText ?? '',
            isSelected: myAnswersId.contains(ans.id),
            isCorrect: ans.isCorrect,
            isLoading: isLoading,
            isCompleted: isCompleted,
            onTap: () => onSubmitTap(ans.id),
          ),
        );
      }).toList(),
    );
  }
}

class TrueFalseAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final bool isLoading;
  final void Function(int? answerId) onSubmitTap;

  const TrueFalseAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.isLoading,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: answers.asMap().entries.map((e) {
        final idx = e.key;
        final ans = e.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: idx == 0 ? 0 : 12,
              right: idx == 1 ? 0 : 12,
            ),
            child: _GlassAnswerTile(
              letter: idx == 0 ? "✓" : "✕",
              text: ans.answerText ?? (idx == 0 ? "True" : "False"),
              isSelected: myAnswersId.contains(ans.id),
              isCorrect: ans.isCorrect,
              isCompleted: isCompleted,
              onTap: () => onSubmitTap(ans.id),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//                       BOTTOM BAR
// ─────────────────────────────────────────────────────────────
class _ModernBottomBar extends StatelessWidget {
  final QuestionModel quiz;

  const _ModernBottomBar({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.78),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (quiz.correctCount != null)
                      _StatItem(
                        icon: Icons.check_circle,
                        color: Colors.greenAccent.shade400,
                        count: quiz.correctCount.toString(),
                      ),
                    const SizedBox(width: 28),
                    if (quiz.wrongCount != null)
                      _StatItem(
                        icon: Icons.cancel,
                        color: Colors.redAccent.shade400,
                        count: quiz.wrongCount.toString(),
                      ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.share_rounded,
                        color: Colors.white70,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: quiz.isBookmarkLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            )
                          : Icon(
                              quiz.isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: quiz.isBookmarked
                                  ? Colors.amber
                                  : Colors.white70,
                            ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  quiz.testTitle ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (quiz.testDescription?.isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      quiz.testDescription!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String count;

  const _StatItem({
    required this.icon,
    required this.color,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 6),
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
