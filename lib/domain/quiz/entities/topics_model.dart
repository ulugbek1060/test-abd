import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/quiz/models/topic_questions_response.dart';
import 'package:testabd/domain/entity/answer_item_model.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class TopicsModel extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<TopicItem> results;

  const TopicsModel({
    this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  @override
  List<Object?> get props => [count, next, previous, results];

  static TopicsModel fromResponse(TopicQuestionsResponse response) {
    return TopicsModel(
      count: response.count,
      next: response.next,
      previous: response.previous,
      results: response.results.map((e) => TopicItem.fromResponse(e)).toList(),
    );
  }
}

// -------------------------------------------------------------
class TopicItem extends Equatable {
  final int? id;
  final UserItemModel? user;
  final String? title;
  final String? description;
  final CategoryModel? category;
  final String? visibility;
  final String? accessMode;
  final String? participantRoles;
  final int? maxParticipants;
  final String? startTime;
  final String? endTime;
  final int? minScoreToFinish;
  final int? participantCountToFinish;
  final int? country;
  final int? region;
  final int? district;
  final bool? isRegionPremium;
  final DateTime? createdAt;
  final double? difficultyPercentage;
  final int? totalQuestions;
  final List<TopicQuestion> questions;

  const TopicItem({
    this.id,
    this.user,
    this.title,
    this.description,
    this.category,
    this.visibility,
    this.accessMode,
    this.participantRoles,
    this.maxParticipants,
    this.startTime,
    this.endTime,
    this.minScoreToFinish,
    this.participantCountToFinish,
    this.country,
    this.region,
    this.district,
    this.isRegionPremium,
    this.createdAt,
    this.difficultyPercentage,
    this.totalQuestions,
    this.questions = const [],
  });

  static TopicItem fromResponse(TopicTestItemResponse response) {
    return TopicItem(
      id: response.id,
      user: UserItemModel.fromResponse1(response.user),
      title: response.title,
      description: response.description,
      category: CategoryModel(
        id: response.category?.id,
        totalTests: response.category?.totalTests,
        totalQuestions: response.category?.totalQuestions,
        title: response.category?.title,
        slug: response.category?.slug,
        description: response.category?.description,
        emoji: response.category?.emoji,
        image: response.category?.image,
      ),
      visibility: response.visibility,
      accessMode: response.accessMode,
      participantRoles: response.participantRoles,
      maxParticipants: response.maxParticipants,
      startTime: response.startTime,
      endTime: response.endTime,
      minScoreToFinish: response.minScoreToFinish,
      participantCountToFinish: response.participantCount,
      country: response.country,
      region: response.region,
      district: response.district,
      isRegionPremium: response.isRegionPremium,
      createdAt: DateTime.parse(response.createdAt ?? ''),
      difficultyPercentage: response.difficultyPercentage,
      totalQuestions: response.totalQuestions,
      questions: response.questions
          .map((e) => TopicQuestion.fromResponse(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    user,
    title,
    description,
    category,
    visibility,
    accessMode,
    participantRoles,
    maxParticipants,
    startTime,
    endTime,
    minScoreToFinish,
    participantCountToFinish,
    country,
    region,
    district,
    isRegionPremium,
    createdAt,
    difficultyPercentage,
    totalQuestions,
    questions,
  ];
}

// -------------------------------------------------------------
class TopicQuestion extends Equatable {
  final int? id;
  final int? test;
  final String? testTitle;
  final String? questionText;
  final String? questionType;
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
  final String? createdAt;
  final String? roundImage;
  final bool? isBookmarked;
  final bool? isFollowing;
  final CategoryModel? category;

  const TopicQuestion({
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
    this.isBookmarked,
    this.isFollowing,
    this.category,
  });

  static TopicQuestion fromResponse(TopicQuestionResponse response) {
    return TopicQuestion(
      id: response.id,
      test: response.test,
      testTitle: response.testTitle,
      questionText: response.questionText,
      questionType: response.questionType,
      orderIndex: response.orderIndex,
      media: response.media,
      answers: response.answers
          .map(
            (e) => AnswerItemModel(
              id: e.id,
              letter: e.letter,
              answerText: e.answerText,
              isCorrect: e.isCorrect ?? false,
            ),
          )
          .toList(),
      testDescription: response.testDescription,
      correctAnswerText: response.correctAnswerText,
      answerLanguage: response.answerLanguage,
      correctCount: response.correctCount,
      wrongCount: response.wrongCount,
      difficultyPercentage: response.difficultyPercentage,
      userAttemptCount: response.userAttemptCount,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isPremium: response.user?.isPremium,
        isFollowing: response.user?.isFollowing,
      ),
      createdAt: response.createdAt,
      roundImage: response.roundImage,
      isBookmarked: response.isBookmarked,
      isFollowing: response.isFollowing,
      category: CategoryModel(
        id: response.category?.id,
        totalTests: response.category?.totalTests,
        totalQuestions: response.category?.totalQuestions,
        title: response.category?.title,
        slug: response.category?.slug,
        description: response.category?.description,
        emoji: response.category?.emoji,
        image: response.category?.image,
      ),
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
}
