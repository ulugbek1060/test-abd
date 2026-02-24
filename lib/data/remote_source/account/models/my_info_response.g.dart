// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyInfoResponseImpl _$$MyInfoResponseImplFromJson(Map<String, dynamic> json) =>
    _$MyInfoResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      country: json['country'] == null
          ? null
          : CountryInfo.fromJson(json['country'] as Map<String, dynamic>),
      region: json['region'] == null
          ? null
          : RegionInfo.fromJson(json['region'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : DistrictInfo.fromJson(json['district'] as Map<String, dynamic>),
      settlement: json['settlement'] == null
          ? null
          : SettlementInfo.fromJson(json['settlement'] as Map<String, dynamic>),
      categoriesOfInterest: (json['categories_of_interest'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coinPercentage: (json['coin_percentage'] as num?)?.toDouble(),
      weeklyTestCount: json['weekly_test_count'] == null
          ? null
          : WeeklyTestCount.fromJson(
              json['weekly_test_count'] as Map<String, dynamic>),
      streakDay: (json['streak_day'] as num?)?.toInt(),
      testsSolved: (json['tests_solved'] as num?)?.toInt(),
      correctCount: (json['correct_count'] as num?)?.toInt(),
      wrongCount: (json['wrong_count'] as num?)?.toInt(),
      averageTime: (json['average_time'] as num?)?.toDouble(),
      lastLogin: json['last_login'] as String?,
      isSuperuser: json['is_superuser'] as bool?,
      username: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      isStaff: json['is_staff'] as bool?,
      dateJoined: json['date_joined'] as String?,
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      isActive: json['is_active'] as bool?,
      role: json['role'] as String?,
      isPremium: json['is_premium'] as bool?,
      isBadged: json['is_badged'] as bool?,
      joinDate: json['join_date'] as String?,
      level: json['level'] as String?,
      liveQuizScore: (json['live_quiz_score'] as num?)?.toInt(),
      isEmailVerified: json['is_email_verified'] as bool?,
      coins: (json['coins'] as num?)?.toInt(),
      referralCode: json['referral_code'] as String?,
      telegramId: json['telegram_id'] as String?,
      invitedBy: json['invited_by'] as String?,
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userPermissions: (json['user_permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MyInfoResponseImplToJson(
        _$MyInfoResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'region': instance.region,
      'district': instance.district,
      'settlement': instance.settlement,
      'categories_of_interest': instance.categoriesOfInterest,
      'coin_percentage': instance.coinPercentage,
      'weekly_test_count': instance.weeklyTestCount,
      'streak_day': instance.streakDay,
      'tests_solved': instance.testsSolved,
      'correct_count': instance.correctCount,
      'wrong_count': instance.wrongCount,
      'average_time': instance.averageTime,
      'last_login': instance.lastLogin,
      'is_superuser': instance.isSuperuser,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'is_staff': instance.isStaff,
      'date_joined': instance.dateJoined,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
      'is_active': instance.isActive,
      'role': instance.role,
      'is_premium': instance.isPremium,
      'is_badged': instance.isBadged,
      'join_date': instance.joinDate,
      'level': instance.level,
      'live_quiz_score': instance.liveQuizScore,
      'is_email_verified': instance.isEmailVerified,
      'coins': instance.coins,
      'referral_code': instance.referralCode,
      'telegram_id': instance.telegramId,
      'invited_by': instance.invitedBy,
      'groups': instance.groups,
      'user_permissions': instance.userPermissions,
    };

_$CountryInfoImpl _$$CountryInfoImplFromJson(Map<String, dynamic> json) =>
    _$CountryInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CountryInfoImplToJson(_$CountryInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$RegionInfoImpl _$$RegionInfoImplFromJson(Map<String, dynamic> json) =>
    _$RegionInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      country: (json['country'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RegionInfoImplToJson(_$RegionInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$DistrictInfoImpl _$$DistrictInfoImplFromJson(Map<String, dynamic> json) =>
    _$DistrictInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      region: (json['region'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DistrictInfoImplToJson(_$DistrictInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$SettlementInfoImpl _$$SettlementInfoImplFromJson(Map<String, dynamic> json) =>
    _$SettlementInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      district: (json['district'] as num?)?.toInt(),
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SettlementInfoImplToJson(
        _$SettlementInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district': instance.district,
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$WeeklyTestCountImpl _$$WeeklyTestCountImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyTestCountImpl(
      monday: (json['Dush'] as num?)?.toInt(),
      tuesday: (json['Sesh'] as num?)?.toInt(),
      wednesday: (json['Chor'] as num?)?.toInt(),
      thursday: (json['Pay'] as num?)?.toInt(),
      friday: (json['Jum'] as num?)?.toInt(),
      saturday: (json['Shan'] as num?)?.toInt(),
      sunday: (json['Yak'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WeeklyTestCountImplToJson(
        _$WeeklyTestCountImpl instance) =>
    <String, dynamic>{
      'Dush': instance.monday,
      'Sesh': instance.tuesday,
      'Chor': instance.wednesday,
      'Pay': instance.thursday,
      'Jum': instance.friday,
      'Shan': instance.saturday,
      'Yak': instance.sunday,
    };
