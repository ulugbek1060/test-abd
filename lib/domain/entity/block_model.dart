import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/quiz/models/user_blocks_response.dart';
import 'package:testabd/domain/entity/category_model.dart';
import 'package:testabd/domain/entity/question_model.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class BlockModel extends Equatable {
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
  final List<QuestionModel> questions;

  const BlockModel({
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

  static BlockModel fromResponse(Block response) {
    return BlockModel(
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
          .map((e) => QuestionModel.fromUserBlockResponse(e))
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
