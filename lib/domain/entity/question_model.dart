import 'package:equatable/equatable.dart';
import 'package:testabd/core/enums/question_type_enum.dart';
import 'package:testabd/data/remote_source/quiz/models/block_detail_response.dart'
    as blockDetail;
import 'package:testabd/data/remote_source/quiz/models/followed_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/question_response.dart';
import 'package:testabd/data/remote_source/quiz/models/random_questions_response.dart';
import 'package:testabd/data/remote_source/quiz/models/user_question_response.dart';
import 'package:testabd/data/remote_source/quiz/models/user_blocks_response.dart'
    as userBlock;
import 'package:testabd/data/remote_source/quiz/models/questions_response.dart'
    as questions;
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class QuestionModel extends Equatable {
  final int? id;
  final int? test;
  final String? testTitle;
  final String? questionText;
  final QuestionType? questionType;
  final int? orderIndex;
  final String? media;
  final List<AnswerItemModel> answers;
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
  final bool isBookmarked;
  final bool? isFollowing;
  final CategoryModel? category;

  // additional
  final bool isBookmarkLoading;
  final bool isLoading;
  final bool isCompleted;
  final bool isCorrect;
  final Set<int> myAnswersId;

  const QuestionModel({
    this.id,
    this.test,
    this.testTitle,
    this.questionText,
    this.questionType,
    this.orderIndex,
    this.media,
    this.answers = const [],
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
    this.isBookmarked = false,
    this.isFollowing,
    this.category,
    this.isLoading = false,
    this.isBookmarkLoading = false,
    this.isCompleted = false,
    this.isCorrect = false,
    this.myAnswersId =  const {},
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
    isLoading,
    isBookmarkLoading,
    isCompleted,
    isCorrect,
    myAnswersId,
  ];

  QuestionModel copyWith({
    int? id,
    int? test,
    String? testTitle,
    String? questionText,
    QuestionType? questionType,
    int? orderIndex,
    String? media,
    List<AnswerItemModel>? answers,
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
    bool? isLoading,
    bool? isBookmarkLoading,
    bool? isCompleted,
    bool? isCorrect,
    Set<int>? myAnswersId,
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
      isLoading: isLoading ?? this.isLoading,
      isBookmarkLoading: isBookmarkLoading ?? this.isBookmarkLoading,
      isCompleted: isCompleted ?? this.isCompleted,
      isCorrect: isCorrect ?? this.isCorrect,
      myAnswersId: myAnswersId ?? this.myAnswersId,
    );
  }

  static QuestionModel fromResponse(QuestionResponse response) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers:
          response.answers
              ?.map(
                (answer) => AnswerItemModel(
                  id: answer.id,
                  letter: answer.letter,
                  answerText: answer.answerText,
                  isCorrect: answer.isCorrect ?? false,
                ),
              )
              .toList() ??
          [],
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      isBookmarked: response.isBookmarked ?? false,
      isFollowing: response.isFollowing ?? false,
      category: CategoryModel(
        id: response.category?.id,
        totalQuestions: response.category?.totalQuestions,
        totalTests: response.category?.totalTests,
        title: response.category?.title,
        slug: response.category?.slug,
        description: response.category?.description,
        emoji: response.category?.emoji,
        image: response.category?.image,
      ),
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromFollowedResponse(Question response) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (answer) => AnswerItemModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromUserQuestionResponse(UserQuestionResponse response) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (answer) => AnswerItemModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromUserBlockResponse(userBlock.Question response) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (answer) => AnswerItemModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromProfileQuestionResponse(
    questions.Question response,
  ) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (answer) => AnswerItemModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromBlockDetailResponse(blockDetail.Question response) {
    return QuestionModel(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: QuestionType.fromString(response.questionType),
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (answer) => AnswerItemModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage?.toDouble(),
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
    );
  }

  static QuestionModel fromAny(dynamic data) {
    return QuestionModel(
      id: data.id,
      test: data.test,
      testTitle: data.testTitle,
      questionText: data.questionText,
      questionType: QuestionType.fromString(data.questionType),
      // TODO: fix this
      orderIndex: data.orderIndex,
      media: data.media,
      answers: data.answers
          ?.map(
            (answer) => AnswerModel(
              id: answer.id,
              letter: answer.letter,
              answerText: answer.answerText,
              isCorrect: answer.isCorrect,
            ),
          )
          .toList(),
      testDescription: data.testDescription,
      correctAnswerText: data.correctAnswerText,
      answerLanguage: data.answerLanguage,
      correctCount: data.correctCount,
      wrongCount: data.wrongCount,
      difficultyPercentage: data.difficultyPercentage?.toDouble(),
      userAttemptCount: data.userAttemptCount,
      user: UserItemModel(
        id: data.user?.id,
        username: data.user?.username,
        profileImage: data.user?.profileImage,
        isBadged: data.user?.isBadged,
        isFollowing: data.user?.isFollowing,
        isPremium: data.user?.isPremium,
      ),
      createdAt: data.createdAt,
      roundImage: data.roundImage,
    );
  }
}
