// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralsListResponseImpl _$$ReferralsListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralsListResponseImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Referral.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReferralsListResponseImplToJson(
        _$ReferralsListResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$ReferralImpl _$$ReferralImplFromJson(Map<String, dynamic> json) =>
    _$ReferralImpl(
      id: (json['id'] as num?)?.toInt(),
      referred: json['referred'] == null
          ? null
          : Referred.fromJson(json['referred'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReferralImplToJson(_$ReferralImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referred': instance.referred,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$ReferredImpl _$$ReferredImplFromJson(Map<String, dynamic> json) =>
    _$ReferredImpl(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
      isFollowing: json['is_following'] as bool?,
    );

Map<String, dynamic> _$$ReferredImplToJson(_$ReferredImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'is_following': instance.isFollowing,
    };
