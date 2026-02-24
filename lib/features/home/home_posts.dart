import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/core/theme/app_images.dart';
import 'package:testabd/core/utils/formatters.dart';
import 'package:testabd/core/widgets/loading_widget.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/features/home/home_cubit.dart';
import 'package:testabd/features/home/home_state.dart';
import 'package:testabd/main.dart';
import 'package:testabd/router/app_router.dart';

class PostsWidget extends StatelessWidget {
  const PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // global loading
        if (state.followedQuizStata.isLoading) {
          return SliverFillRemaining(child: Center(child: ProgressView()));
        }

        // loaded list
        final questions = state.followedQuizStata.questions;
        return SliverMainAxisGroup(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final quiz = questions[index];
                return QuestionCard(quiz: quiz);
              }, childCount: questions.length),
            ),

            // pagination loading
            if (state.followedQuizStata.isLoadMore)
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewPadding.bottom + 16,
                  ),
                  height: 56,
                  child: ProgressView(),
                ),
              ),
          ],
        );
      },
    );
  }
}

class QuestionCard extends StatelessWidget {
  final QuestionModel quiz;

  const QuestionCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// card container height
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(0),
        backgroundBlendMode: BlendMode.darken,
        image: DecorationImage(
          image: NetworkImage(quiz.roundImage ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// header of the card
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () => context.push(
                  AppRouter.userProfileWithUsername(quiz.user?.username ?? ''),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // circle image
                    _HeaderUserImage(
                      imageUrl: quiz.user?.profileImage,
                      username: quiz.user?.username ?? '',
                      size: 40,
                    ),

                    SizedBox(width: 6),

                    // username and date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          capitalize(quiz.user?.username),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          formatDate(quiz.createdAt),
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),

                    Spacer(),

                    if (!(quiz.user?.isFollowing ?? false))
                      SizedBox(
                        height: 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: quiz.user?.isFollowing ?? false
                                ? Theme.of(
                                    context,
                                  ).colorScheme.onSurface.withAlpha(150)
                                : Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: quiz.user?.isFollowing ?? false
                              ? null
                              : () {},
                          child: quiz.isLoading
                              ? const ProgressView()
                              : Text(
                                  quiz.user?.isFollowing ?? false
                                      ? 'Unfollow'
                                      : 'Follow',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            /// Quiz sections question and answers
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// quiz
                    Flexible(
                      child: Text(
                        quiz.questionText ?? '',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),

                    /// space
                    SizedBox(height: 16),

                    /// answers
                    _AnswersList(
                      questionId: quiz.id,
                      answers: quiz.answers,
                      questionType: quiz.questionType,
                      myAnswersId: quiz.myAnswersId,
                      isCompleted: quiz.isCompleted,
                      isLoading: quiz.isLoading,
                    ),
                  ],
                ),
              ),
            ),

            /// question information
            _BottomQuestionInformation(
              correctCount: quiz.correctCount?.toString() ?? '',
              wrongCount: quiz.wrongCount?.toString() ?? '',
              title: quiz.testTitle ?? '',
              description: quiz.testDescription ?? '',
              isBookmarkLoading: quiz.isBookmarkLoading,
              isBookmark: quiz.isBookmarked,
              onShare: () {},
              onSave: () => context.read<HomeCubit>().toggleBookmark(quiz.id),
            ),
          ],
        ),
      ),
    );
  }
}

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
    required this.onItemTap,
    required this.onSubmitTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ...answers.map((e) => _buildItem(context, e)),

        // Show Submit button ONLY if quiz is NOT completed
        if (!isCompleted)
          ElevatedButton(
            onPressed: myAnswersId.isNotEmpty
                ? () => onSubmitTap(myAnswersId)
                : null,
            child: isLoading ? const ProgressView() : const Text("Submit"),
          ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, AnswerItemModel answer) {
    final selected = myAnswersId.contains(answer.id);
    final correct = answer.isCorrect;

    return _BlurContainer(
      borderRadius: 16,
      borderColor: _getBorderColor(selected, correct),
      child: Row(
        children: [
          // Showing icon or checkbox depending on state
          _buildLeadingIcon(answer),

          const SizedBox(width: 8),

          Flexible(
            child: Text(
              answer.answerText ?? '',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor(bool selected, bool correct) {
    if (!isCompleted) {
      return selected ? Colors.green : Colors.white;
    }

    if (selected) {
      return correct ? Colors.green : Colors.red;
    }

    return Colors.white;
  }

  Widget _buildLeadingIcon(AnswerItemModel answer) {
    final selected = myAnswersId.contains(answer.id);
    return Checkbox(
      value: selected,
      onChanged: isCompleted
          ? null
          : (_) {
              if (answer.id != null) {
                onItemTap(answer.id!);
              } else {
                logger.e('Answer id is null');
              }
            },
      activeColor: Colors.green,
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.white, width: 1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    );
  }
}

class SingleAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final void Function(int? answerId) onSubmitTap;

  const SingleAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: answers.map((e) {
        return InkWell(
          onTap: isCompleted ? null : () => onSubmitTap(e.id),
          child: _BlurContainer(
            borderRadius: 16,
            borderColor: getBorderColor(e),
            child: Row(
              children: [
                getLeading(context, e),

                const SizedBox(width: 8),

                Flexible(
                  child: Text(
                    e.answerText ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.white),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget getLeading(BuildContext context, AnswerItemModel answer) =>
      CircleAvatar(
        backgroundColor: Colors.grey,
        child: answer.isLoading
            ? ProgressView(color: Colors.white)
            : getIcon(context, answer),
      );

  Color getBorderColor(AnswerItemModel answer) {
    final selected = myAnswersId.contains(answer.id);
    final correct = answer.isCorrect;

    if (!isCompleted) {
      return selected ? Colors.green : Colors.white;
    }

    if (selected) {
      return correct ? Colors.green : Colors.red;
    }

    return Colors.white;
  }

  Widget getIcon(BuildContext context, AnswerItemModel answer) {
    final selected = myAnswersId.contains(answer.id);
    final correct = answer.isCorrect;

    // If the quiz is not completed → always show the letter
    if (!isCompleted) {
      return _buildLetter(context, answer.letter);
    }

    // Completed and selected
    if (selected) {
      final isCorrect = correct;
      return CircleAvatar(
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        child: Icon(
          isCorrect ? Icons.check_outlined : Icons.clear_rounded,
          color: Colors.white,
        ),
      );
    }

    // Completed but NOT selected → show letter
    return _buildLetter(context, answer.letter);
  }

  Widget _buildLetter(BuildContext context, String? letter) => Text(
    letter ?? '',
    style: Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(color: Colors.white),
  );
}

class TrueFalseAnswerCard extends StatelessWidget {
  final List<AnswerItemModel> answers;
  final Set<int> myAnswersId;
  final bool isCompleted;
  final void Function(int? answerId) onSubmitTap;

  const TrueFalseAnswerCard({
    super.key,
    required this.answers,
    required this.myAnswersId,
    required this.isCompleted,
    required this.onSubmitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 16,
      children: answers.mapIndexed((index, e) {
        return Expanded(
          child: InkWell(
            onTap: isCompleted ? null : () => onSubmitTap(e.id),
            child: _BlurContainer(
              borderRadius: 16,
              borderColor: getBorderColor(e),
              child: Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  getIcon(context, e, index),
                  Text(
                    e.answerText ?? '',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.white),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color getBorderColor(AnswerItemModel answer) {
    final selected = myAnswersId.contains(answer.id);
    final correct = answer.isCorrect;

    if (!isCompleted) {
      return selected ? Colors.green : Colors.white;
    }

    if (selected) {
      return correct ? Colors.green : Colors.red;
    }

    return Colors.white;
  }

  Widget getIcon(BuildContext context, AnswerItemModel answer, int index) {
    final selected = myAnswersId.contains(answer.id);
    final correct = answer.isCorrect;
    final isThumbUp = index == 0;

    if (answer.isLoading) {
      return ProgressView(color: Colors.white);
    }

    if (!isCompleted) {
      return Icon(
        isThumbUp ? Icons.thumb_up_rounded : Icons.thumb_down_alt,
        color: isThumbUp ? Colors.green : Colors.red,
      );
    }

    if (selected) {
      return Icon(
        correct ? Icons.check_circle : Icons.cancel,
        color: correct ? Colors.green : Colors.red,
      );
    }

    return Icon(
      index == 0 ? Icons.thumb_up_rounded : Icons.thumb_down_alt,
      color: index == 0 ? Colors.green : Colors.red,
    );
  }
}

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
    final cubit = context.read<HomeCubit>();
    switch (questionType) {
      case QuestionType.multipleSelect:
        return MultipleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          isLoading: isLoading,
          onItemTap: (answerId) =>
              cubit.setMultipleAnswer(questionId!, answerId),
          onSubmitTap: isLoading
              ? (_) {}
              : (answerIds) => cubit.submitAnswer(questionId!, answerIds),
        );
      case QuestionType.singleSelect:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          onSubmitTap: isLoading
              ? (_) {}
              : (answerId) => cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );
      case QuestionType.trueFalse:
        return TrueFalseAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          onSubmitTap: isLoading
              ? (_) {}
              : (answerId) => cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );

      // TODO create text question card
      case QuestionType.textQuestion:
        return TrueFalseAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          onSubmitTap: isLoading
              ? (_) {}
              : (answerId) => cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );
      default:
        return SingleAnswerCard(
          answers: answers,
          myAnswersId: myAnswersId,
          isCompleted: isCompleted,
          onSubmitTap: isLoading
              ? (_) {}
              : (answerId) => cubit.submitAnswer(questionId!, {answerId ?? -1}),
        );
    }
  }
}

class _HeaderUserImage extends StatelessWidget {
  final String? imageUrl;
  final String username;
  final double size;
  final double borderWidth;
  final Color borderColor;

  const _HeaderUserImage({
    this.imageUrl,
    required this.username,
    this.size = 50.0,
    this.borderWidth = 2.0,
    this.borderColor = Colors.white,
  });

  String _getInitial() {
    if (username.isEmpty) return '';
    return username[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(color: borderColor, shape: BoxShape.circle),
      child: ClipOval(
        child: CachedNetworkImage(
          width: 36,
          height: 36,
          imageUrl: imageUrl ?? '',
          fit: BoxFit.cover,
          placeholder: (_, __) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
          errorWidget: (_, __, ___) =>
              Image.asset(AppImages.defaultAvatar, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _BlurContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color borderColor;
  final double blurX;
  final double blurY;
  final double opacity;

  const _BlurContainer({
    required this.child,
    this.borderRadius = 16,
    this.borderColor = Colors.white,
    this.blurX = 10,
    this.blurY = 10,
    this.opacity = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor),
            color: Colors.white.withOpacity(opacity),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _BottomQuestionInformation extends StatelessWidget {
  final String correctCount;
  final String wrongCount;
  final String title;
  final String description;
  final bool isBookmarkLoading;
  final bool isBookmark;
  final Function() onShare;
  final Function() onSave;

  const _BottomQuestionInformation({
    super.key,
    required this.correctCount,
    required this.wrongCount,
    required this.title,
    required this.description,
    required this.isBookmarkLoading,
    required this.onShare,
    required this.onSave,
    required this.isBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, bottom: 20, left: 12, right: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // difficulty percentage
              if (correctCount.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      correctCount,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              const SizedBox(width: 8),

              if (wrongCount.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.cancel, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      wrongCount,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),

              Spacer(),

              // share buttons
              IconButton(
                onPressed: onShare,
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              IconButton(
                onPressed: onSave,
                icon: isBookmarkLoading
                    ? ProgressView()
                    : Icon(
                        isBookmark
                            ? Icons.bookmark_outlined
                            : Icons.bookmark_border_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ],
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
