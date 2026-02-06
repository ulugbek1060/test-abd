import 'package:equatable/equatable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/data/remote_source/quiz/models/followed_questions_response.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';
import 'package:testabd/domain/quiz/entities/quiz_item.dart';

class GlobalQuizModel extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<QuizItem>? results;

  const GlobalQuizModel({this.count, this.next, this.previous, this.results});

  static GlobalQuizModel fromResponse(FollowedQuestionsResponse response) {
    return GlobalQuizModel(
      count: response.count,
      next: response.next,
      previous: response.previous,
      results: response.results
          .map(
            (e) => QuizItem(
              id: e.id,
              test: e.test,
              testTitle: e.test_title,
              questionText: e.question_text,
              questionType: QuestionType.fromString(e.question_type),
              orderIndex: e.order_index,
              media: e.media,
              answers: e.answers
                  .map(
                    (a) => AnswerItemModel(
                      id: a.id,
                      letter: a.letter,
                      answerText: a.answer_text,
                      isCorrect: a.is_correct ?? false,
                    ),
                  )
                  .toList(),
              testDescription: e.test_description,
              correctAnswerText: e.correct_answer_text,
              answerLanguage: e.answer_language,
              correctCount: e.correct_count,
              wrongCount: e.wrong_count,
              difficultyPercentage: e.difficulty_percentage,
              userAttemptCount: e.user_attempt_count,
              user: UserItemModel(
                id: e.user?.id,
                username: e.user?.username,
                profileImage: e.user?.profile_image,
                isBadged: e.user?.is_badged,
                isPremium: e.user?.is_premium,
                isFollowing: e.user?.is_following,
              ),
              createdAt: e.created_at,
              roundImage: e.round_image,
              isBookmarked: e.is_bookmarked,
              isFollowing: e.is_following,
              category: CategoryModel(
                id: e.category?.id,
                totalTests: e.category?.total_tests,
                totalQuestions: e.category?.total_questions,
                title: e.category?.title,
                slug: e.category?.slug,
                description: e.category?.description,
                emoji: e.category?.emoji,
                image: e.category?.image,
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
