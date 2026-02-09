import 'package:testabd/core/enums/access_enum.dart';
import 'package:testabd/data/remote_source/quiz/models/block_detail_response.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class BlockDetailModel {
  final int? id;
  final UserItemModel? user;
  final String? title;
  final String? description;
  final CategoryModel? category;
  final AccessType? visibility;
  final String? accessMode;
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
  final List<QuestionModel> questions;
  final bool? isBookmarked;
  final int? participantCount;

  BlockDetailModel({
    this.id,
    this.user,
    this.title,
    this.description,
    this.category,
    this.visibility,
    this.accessMode,
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
    this.isBookmarked,
    this.participantCount,
  });

  factory BlockDetailModel.fromResponse(BlockDetailResponse response) {
    return BlockDetailModel(
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
        totalTests: response.category?.totalTests,
        totalQuestions: response.category?.totalQuestions,
        description: response.category?.description,
        title: response.category?.title,
        image: response.category?.image,
        slug: response.category?.slug,
        emoji: response.category?.emoji,
      ),
      visibility: AccessType.fromString(response.visibility),
      accessMode: response.accessMode,
      maxParticipants: response.maxParticipants,
      startTime: response.startTime,
      endTime: response.endTime,
      minScoreToFinish: response.minScoreToFinish,
      participantCountToFinish: response.participantCountToFinish,
      country: response.country,
      region: response.region,
      district: response.district,
      isRegionPremium: response.isRegionPremium,
      createdAt: response.createdAt,
      difficultyPercentage: response.difficultyPercentage,
      totalQuestions: response.totalQuestions,
      questions: response.questions
          .map(QuestionModel.fromBlockDetailResponse)
          .toList(),
      isBookmarked: response.isBookmarked,
      participantCount: response.participantCount,
    );
  }
}
