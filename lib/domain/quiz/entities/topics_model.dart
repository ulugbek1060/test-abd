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

  static TopicsModel fromResponse(TopicRelatedQuestionsResponse response) {
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
  final String? category;
  final String? visibility;
  final String? accessMode;
  final String? participantRoles;
  final int? maxParticipants;
  final String? startTime;
  final String? endTime;
  final int? minScoreToFinish;
  final int? participantCountToFinish;
  final String? country;
  final String? region;
  final String? district;
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

  static TopicItem fromResponse(TopicQuestionItemResponse response) {
    return TopicItem(
      id: response.id,
      user: UserItemModel.fromResponse1(response.user),
      title: response.title,
      description: response.description,
      category: response.category,
      visibility: response.visibility,
      accessMode: response.access_mode,
      participantRoles: response.participant_roles,
      maxParticipants: response.max_participants,
      startTime: response.start_time,
      endTime: response.end_time,
      minScoreToFinish: response.min_score_to_finish,
      participantCountToFinish: response.participant_count_to_finish,
      country: response.country,
      region: response.region,
      district: response.district,
      isRegionPremium: response.is_region_premium,
      createdAt: DateTime.parse(response.created_at ?? ''),
      difficultyPercentage: response.difficulty_percentage,
      totalQuestions: response.total_questions,
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

  static TopicQuestion fromResponse(TopicTestItemResponse response) {
    return TopicQuestion(
      id: response.id,
      test: response.test,
      testTitle: response.test_title,
      questionText: response.question_text,
      questionType: response.question_type,
      orderIndex: response.order_index,
      media: response.media,
      answers: response.answers
          .map(
            (e) => AnswerItemModel(
              id: e.id,
              letter: e.letter,
              answerText: e.answer_text,
              isCorrect: e.is_correct ?? false,
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
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profile_image,
        isBadged: response.user?.is_badged,
        isPremium: response.user?.is_premium,
        isFollowing: response.user?.is_following,
      ),
      createdAt: response.created_at,
      roundImage: response.round_image,
      isBookmarked: response.is_bookmarked,
      isFollowing: response.is_following,
      category: CategoryModel(
        id: response.category?.id,
        totalTests: response.category?.total_tests,
        totalQuestions: response.category?.total_questions,
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
