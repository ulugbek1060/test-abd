import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/quiz/models/question_response.dart';
import 'package:testabd/data/remote_source/quiz/models/random_questions_response.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class QuestionModel extends Equatable {
  final int? id;
  final int? test;
  final String? testTitle;
  final String? questionText;
  final String? questionType;
  final int? orderIndex;
  final String? media;
  final List<AnswerModel>? answers;
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

  const QuestionModel({
    this.id,
    this.test,
    this.testTitle,
    this.questionText,
    this.questionType,
    this.orderIndex,
    this.media,
    this.answers,
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
  });

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
  ];

  QuestionModel copyWith({
    int? id,
    int? test,
    String? testTitle,
    String? questionText,
    String? questionType,
    int? orderIndex,
    String? media,
    List<AnswerModel>? answers,
    String? testDescription,
    String? correctAnswerText,
    String? answerLanguage,
    int? correctCount,
    int? wrongCount,
    double? difficultyPercentage,
    int? userAttemptCount,
    UserItemModel? user,
    DateTime? createdAt,
    String? roundImage,
    bool? isBookmarked,
    bool? isFollowing,
    CategoryModel? category,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      test: test ?? this.test,
      testTitle: testTitle ?? this.testTitle,
      questionText: questionText ?? this.questionText,
      questionType: questionType ?? this.questionType,
      orderIndex: orderIndex ?? this.orderIndex,
      media: media ?? this.media,
      answers: answers ?? this.answers,
      testDescription: testDescription ?? this.testDescription,
      correctAnswerText: correctAnswerText ?? this.correctAnswerText,
      answerLanguage: answerLanguage ?? this.answerLanguage,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      difficultyPercentage: difficultyPercentage ?? this.difficultyPercentage,
      userAttemptCount: userAttemptCount ?? this.userAttemptCount,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
      roundImage: roundImage ?? this.roundImage,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isFollowing: isFollowing ?? this.isFollowing,
      category: category ?? this.category,
    );
  }

  static QuestionModel fromResponse(QuestionResponse result) {
    return QuestionModel(
      id: result.id,
      test: result.test,
      testTitle: result.testTitle,
      questionText: result.questionText,
      questionType: result.questionType,
      orderIndex: result.orderIndex,
      media: result.media,
      answers: result.answers
          ?.map(
            (answer) => AnswerModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect,
            ),
          )
          .toList(),
      testDescription: result.testDescription,
      correctAnswerText: result.correctAnswerText,
      answerLanguage: result.answerLanguage,
      correctCount: result.correctCount,
      wrongCount: result.wrongCount,
      difficultyPercentage: result.difficultyPercentage?.toDouble(),
      userAttemptCount: result.userAttemptCount,
      user: UserItemModel(
        id: result.user?.id,
        username: result.user?.username,
        profileImage: result.user?.profileImage,
        isBadged: result.user?.isBadged,
        isFollowing: result.user?.isFollowing,
        isPremium: result.user?.isPremium,
      ),
      createdAt: result.createdAt,
      roundImage: result.roundImage,
    );
  }
}
