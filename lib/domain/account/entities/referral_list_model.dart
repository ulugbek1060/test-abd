import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/account/models/referrals_list_response.dart';
import 'package:testabd/domain/entity/user_item_model.dart';

class ReferralListModel extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<ReferralResult> results;

  const ReferralListModel({
    this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  static ReferralListModel fromResponse(ReferralsListResponse response) {
    return ReferralListModel(
      count: response.count,
      next: response.next,
      previous: response.previous,
      results:
          response.results
              ?.map((e) => ReferralResult.fromResponse(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}

class ReferralResult extends Equatable {
  final int? id;
  final UserItemModel? referred;
  final DateTime? createdAt;

  const ReferralResult({
    required this.id,
    required this.referred,
    required this.createdAt,
  });

  static ReferralResult fromResponse(Referral referral) {
    return ReferralResult(
      id: referral.id,
      referred: UserItemModel(
        id: referral.referred?.id,
        username: referral.referred?.username,
        profileImage: referral.referred?.profileImage,
        isFollowing: referral.referred?.isFollowing,
      ),
      createdAt: referral.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, referred, createdAt];
}
