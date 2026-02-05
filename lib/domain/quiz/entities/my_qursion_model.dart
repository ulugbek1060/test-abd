import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/quiz/models/my_block_response.dart';
import 'package:testabd/domain/entity/access_enum.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class MyBlockModel extends Equatable {
  final int? id;
  final UserItemModel? user;
  final String? title;
  final String? description;
  final CategoryModel? category;
  final int? categoryId;
  final AccessType? visibility;
  final String? accessMode;
  final String? participantRoles;
  final int? maxParticipants;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? minScoreToFinish;
  final int? participantCountToFinish;
  final int? country;
  final int? countryId;
  final int? region;
  final int? regionId;
  final int? district;
  final int? districtId;
  final bool? isRegionPremium;
  final DateTime? createdAt;
  final int? difficultyPercentage;
  final int? totalQuestions;
  final String? questions;
  final bool? isBookmarked;
  final int? participantCount;
  final int? averageQuestionDifficulty;
  final int? averageCompletionTimeMinutes;
  final int? totalCorrectAttempts;
  final int? totalWrongAttempts;

  const MyBlockModel({
    this.id,
    this.user,
    this.title,
    this.description,
    this.category,
    this.categoryId,
    this.visibility,
    this.accessMode,
    this.participantRoles,
    this.maxParticipants,
    this.startTime,
    this.endTime,
    this.minScoreToFinish,
    this.participantCountToFinish,
    this.country,
    this.countryId,
    this.region,
    this.regionId,
    this.district,
    this.districtId,
    this.isRegionPremium,
    this.createdAt,
    this.difficultyPercentage,
    this.totalQuestions,
    this.questions,
    this.isBookmarked,
    this.participantCount,
    this.averageQuestionDifficulty,
    this.averageCompletionTimeMinutes,
    this.totalCorrectAttempts,
    this.totalWrongAttempts,
  });

  static MyBlockModel fromResponse(MyBlockResponse response) {
    return MyBlockModel(
      id: response.id,
      user: UserItemModel(
        id: response.user?.id,
        username: response.user?.username,
        profileImage: response.user?.profileImage,
        isBadged: response.user?.isBadged,
        isFollowing: response.user?.isFollowing,
        isPremium: response.user?.isPremium,
      ),
      title: response.title,
      description: response.description,
      category: CategoryModel(
        id: response.category?.id,
        totalQuestions: response.category?.totalQuestions,
        totalTests: response.category?.totalTests,
        title: response.category?.title,
        slug: response.category?.slug,
        description: response.category?.description,
      ),
      visibility: AccessType.fromString(response.visibility),
      accessMode: response.accessMode,
      participantRoles: response.participantRoles,
      maxParticipants: response.maxParticipants,
      startTime: response.startTime,
      endTime: response.endTime,
      minScoreToFinish: response.minScoreToFinish,
      participantCountToFinish: response.participantCountToFinish,
      country: response.country,
      countryId: response.countryId,
      region: response.region,
      // regionId: response.regionId,
      district: response.district,
      districtId: response.districtId,
      isRegionPremium: response.isRegionPremium,
      createdAt: response.createdAt,
      difficultyPercentage: response.difficultyPercentage,
      totalQuestions: response.totalQuestions,
      // questions: response.questions,
      isBookmarked: response.isBookmarked,
      participantCount: response.participantCount,
      averageQuestionDifficulty: response.averageQuestionDifficulty,
      averageCompletionTimeMinutes: response.averageCompletionTimeMinutes,
      totalCorrectAttempts: response.totalCorrectAttempts,
      totalWrongAttempts: response.totalWrongAttempts,
    );
  }

  @override
  List<Object?> get props => [
    id,
    user,
    title,
    description,
    category,
    categoryId,
    visibility,
    accessMode,
    participantRoles,
    maxParticipants,
    startTime,
    endTime,
    minScoreToFinish,
    participantCountToFinish,
    country,
    countryId,
    region,
    regionId,
    district,
    districtId,
    isRegionPremium,
    createdAt,
    difficultyPercentage,
    totalQuestions,
    questions,
    isBookmarked,
    participantCount,
    averageQuestionDifficulty,
    averageCompletionTimeMinutes,
    totalCorrectAttempts,
    totalWrongAttempts,
  ];
}
