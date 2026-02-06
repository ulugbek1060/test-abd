import 'package:equatable/equatable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/data/remote_source/quiz/models/user_question_response.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';

class QuizItem extends Equatable {
  final int? id;
  final int? test;
  final String? testTitle;
  final String? questionText;
  final QuestionType? questionType;
  final int? orderIndex;
  final String? media;
  final List<AnswerItemModel> answers;
  final List<int> myAnswersId;
  final bool isCorrect;
  final String? testDescription;
  final String? correctAnswerText;
  final String? answerLanguage;
  final int? correctCount;
  final int? wrongCount;
  final double? difficultyPercentage;
  final int? userAttemptCount;
  final UserItemModel? user;
  final DateTime? createdAt;
  final String? roundImage;
  final bool? isBookmarked;
  final bool? isFollowing;
  final CategoryModel? category;
  final bool isLoading;
  final bool isCompleted;

  const QuizItem({
    this.id,
    this.test,
    this.testTitle,
    this.questionText,
    this.questionType,
    this.orderIndex,
    this.media,
    this.answers = const [],
    this.myAnswersId = const [],
    this.isCorrect = false,
    this.testDescription,
    this.correctAnswerText,
    this.answerLanguage,
    this.correctCount,
    this.wrongCount,
    this.difficultyPercentage,
    this.userAttemptCount,
    this.user,
    this.createdAt,
    this.roundImage,
    this.isBookmarked,
    this.isFollowing,
    this.category,
    this.isLoading = false,
    this.isCompleted = false,
  });

  QuizItem copyWith({
    List<int>? myAnswersId,
    List<AnswerItemModel>? answers,
    bool? isCorrect,
    bool? isLoading,
    bool? isCompleted,
  }) {
    return QuizItem(
      id: id,
      test: test,
      testTitle: testTitle,
      questionText: questionText,
      questionType: questionType,
      orderIndex: orderIndex,
      media: media,
      answers: answers ?? this.answers,
      myAnswersId: myAnswersId ?? this.myAnswersId,
      isCorrect: isCorrect ?? this.isCorrect,
      testDescription: testDescription,
      correctAnswerText: correctAnswerText,
      answerLanguage: answerLanguage,
      correctCount: correctCount,
      wrongCount: wrongCount,
      difficultyPercentage: difficultyPercentage,
      userAttemptCount: userAttemptCount,
      user: user,
      createdAt: createdAt,
      roundImage: roundImage,
      isBookmarked: isBookmarked,
      isFollowing: isFollowing,
      category: category,
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  static QuizItem fromResponse(UserQuestionResponse response) {
    return QuizItem(
      id: response.id,
      test: response.test,
      testTitle: response.test_title,
      questionText: response.question_text,
      questionType: QuestionType.fromString(response.question_type),
      orderIndex: response.order_index,
      media: response.media,
      answers: response.answers
          .map(
            (a) => AnswerItemModel(
              id: a.id,
              letter: a.letter,
              answerText: a.answer_text,
              isCorrect: a.is_correct ?? false,
            ),
          )
          .toList(),
      testDescription: response.test_description,
      correctAnswerText: response.correct_answer_text,
      answerLanguage: response.answer_language,
      correctCount: response.correct_count,
      wrongCount: response.wrong_count,
      difficultyPercentage: response.difficulty_percentage,
      userAttemptCount: response.user_attempt_count,
      user: UserItemModel(
        id: response.user!.id,
        username: response.user!.username,
        profileImage: response.user!.profile_image,
        isBadged: response.user!.is_badged,
        isPremium: response.user!.is_premium,
        isFollowing: response.user!.is_following,
      ),
      createdAt: DateTime.parse(response.created_at ?? ''),
      roundImage: response.round_image,
      isBookmarked: response.is_bookmarked,
      isFollowing: response.is_following,
      category: null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    test,
    testTitle,
    questionText,
    questionType,
    orderIndex,
    media,
    answers,
    myAnswersId,
    isCorrect,
    testDescription,
    correctAnswerText,
    answerLanguage,
    correctCount,
    wrongCount,
    difficultyPercentage,
    userAttemptCount,
    user,
    createdAt,
    roundImage,
    isBookmarked,
    isFollowing,
    category,
    isLoading,
    isCompleted,
  ];
}
