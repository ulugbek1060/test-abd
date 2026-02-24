import 'package:equatable/equatable.dart';
import 'package:testabd/core/enums/knowledge_level_enum.dart';
import 'package:testabd/data/local_source/entities/my_info_db.dart';
import 'package:testabd/data/remote_source/account/models/my_info_response.dart';
import 'package:testabd/domain/account/entities/country_model.dart';
import 'package:testabd/domain/account/entities/district_model.dart';
import 'package:testabd/domain/account/entities/region_model.dart';
import 'package:testabd/domain/account/entities/settlement_model.dart';
import 'package:testabd/domain/entity/weekly_test_count_model.dart';

class MyInfoModel extends Equatable {
  final int? id;
  final CountryModel? country;
  final RegionModel? region;
  final DistrictModel? district;
  final SettlementModel? settlement;
  final List<String>? categoriesOfInterest;
  final double? coinPercentage;
  final WeeklyTestCountModel? weeklyTestCount;
  final int? streakDay;
  final int? testsSolved;
  final int? correctCount;
  final int? wrongCount;
  final double? averageTime;
  final DateTime? lastLogin;
  final bool? isSuperuser;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? isStaff;
  final DateTime? dateJoined;
  final String? profileImage;
  final String? bio;
  final String? phoneNumber;
  final DateTime? createdAt;
  final bool? isActive;
  final String? role;
  final bool? isPremium;
  final bool? isBadged;
  final DateTime? joinDate;
  final KnowledgeLevel? level;
  final int? liveQuizScore;
  final bool? isEmailVerified;
  final int? coins;
  final String? referralCode;
  final String? telegramId;
  final dynamic invitedBy;
  final List<String>? groups;
  final List<String>? userPermissions;

  const MyInfoModel({
    this.id,
    this.country,
    this.region,
    this.district,
    this.settlement,
    this.categoriesOfInterest,
    this.coinPercentage,
    this.weeklyTestCount,
    this.streakDay,
    this.testsSolved,
    this.correctCount,
    this.wrongCount,
    this.averageTime,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.dateJoined,
    this.profileImage,
    this.bio,
    this.phoneNumber,
    this.createdAt,
    this.isActive,
    this.role,
    this.isPremium,
    this.isBadged,
    this.joinDate,
    this.level,
    this.liveQuizScore,
    this.isEmailVerified,
    this.coins,
    this.referralCode,
    this.telegramId,
    this.invitedBy,
    this.groups,
    this.userPermissions,
  });

  double findAccuracy() {
    return double.parse(
      (((correctCount ?? 0) / (testsSolved ?? 1)) * 100).toStringAsFixed(2),
    );
  }

  String get fullName => "$firstName $lastName";

  static MyInfoModel fromResponse(MyInfoResponse? response) {
    return MyInfoModel(
      id: response?.id,
      country: response?.country == null
          ? null
          : CountryModel(
              id: response?.country?.id,
              name: response?.country?.name,
              code: response?.country?.code,
              lat: response?.country?.lat,
              lon: response?.country?.lon,
            ),
      region: response?.region == null
          ? null
          : RegionModel(
              id: response?.region?.id,
              name: response?.region?.name,
              lat: response?.region?.lat,
              lon: response?.region?.lon,
              country: response?.region?.country,
            ),
      district: response?.district == null
          ? null
          : DistrictModel(
              id: response?.district?.id,
              name: response?.district?.name,
              lat: response?.district?.lat,
              lon: response?.district?.lon,
              region: response?.district?.region,
            ),
      settlement: response?.settlement == null
          ? null
          : SettlementModel(
              id: response?.settlement?.id,
              name: response?.settlement?.name,
              lat: response?.settlement?.lat,
              lon: response?.settlement?.lon,
              district: response?.settlement?.district,
            ),
      categoriesOfInterest: response?.categoriesOfInterest,
      coinPercentage: response?.coinPercentage,
      weeklyTestCount: WeeklyTestCountModel(
        dush: response?.weeklyTestCount?.monday,
        sesh: response?.weeklyTestCount?.tuesday,
        chor: response?.weeklyTestCount?.wednesday,
        pay: response?.weeklyTestCount?.thursday,
        jum: response?.weeklyTestCount?.friday,
        shan: response?.weeklyTestCount?.saturday,
        yak: response?.weeklyTestCount?.sunday,
      ),
      streakDay: response?.streakDay,
      testsSolved: response?.testsSolved,
      correctCount: response?.correctCount,
      wrongCount: response?.wrongCount,
      averageTime: response?.averageTime,
      lastLogin: DateTime.tryParse(response?.lastLogin ?? ''),
      isSuperuser: response?.isSuperuser,
      username: response?.username,
      firstName: response?.firstName,
      lastName: response?.lastName,
      email: response?.email,
      isStaff: response?.isStaff,
      dateJoined: DateTime.tryParse(response?.dateJoined ?? ''),
      profileImage: response?.profileImage,
      bio: response?.bio,
      phoneNumber: response?.phoneNumber,
      createdAt: DateTime.tryParse(response?.createdAt ?? ''),
      isActive: response?.isActive,
      role: response?.role,
      isPremium: response?.isPremium,
      isBadged: response?.isBadged,
      joinDate: DateTime.tryParse(response?.joinDate ?? ''),
      level: KnowledgeLevel.tryParse(response?.level),
      liveQuizScore: response?.liveQuizScore,
      isEmailVerified: response?.isEmailVerified,
      coins: response?.coins,
      referralCode: response?.referralCode,
      telegramId: response?.telegramId,
      invitedBy: response?.invitedBy,
      groups: response?.groups,
      userPermissions: response?.userPermissions,
    );
  }

  static MyInfoModel fromDb(MyInfoDb? dbModel) {
    return MyInfoModel(
      id: dbModel?.id,
      country: CountryModel(
        id: dbModel?.country?.id,
        name: dbModel?.country?.name,
        code: dbModel?.country?.code,
        lat: dbModel?.country?.lat,
        lon: dbModel?.country?.lon,
      ),
      region: RegionModel(
        id: dbModel?.region?.id,
        name: dbModel?.region?.name,
        lat: dbModel?.region?.lat,
        lon: dbModel?.region?.lon,
        country: dbModel?.region?.country,
      ),
      district: DistrictModel(
        id: dbModel?.district?.id,
        name: dbModel?.district?.name,
        lat: dbModel?.district?.lat,
        lon: dbModel?.district?.lon,
        region: dbModel?.district?.region,
      ),
      settlement: SettlementModel(
        id: dbModel?.settlement?.id,
        name: dbModel?.settlement?.name,
        lat: dbModel?.settlement?.lat,
        lon: dbModel?.settlement?.lon,
        district: dbModel?.settlement?.district,
      ),
      categoriesOfInterest: dbModel?.categoriesOfInterest,
      coinPercentage: dbModel?.coinPercentage,
      weeklyTestCount: WeeklyTestCountModel(
        dush: dbModel?.weeklyTestCount?.dush,
        sesh: dbModel?.weeklyTestCount?.sesh,
        chor: dbModel?.weeklyTestCount?.chor,
        pay: dbModel?.weeklyTestCount?.pay,
        jum: dbModel?.weeklyTestCount?.jum,
        shan: dbModel?.weeklyTestCount?.shan,
        yak: dbModel?.weeklyTestCount?.yak,
      ),
      streakDay: dbModel?.streakDay,
      testsSolved: dbModel?.testsSolved,
      correctCount: dbModel?.correctCount,
      wrongCount: dbModel?.wrongCount,
      averageTime: dbModel?.averageTime,
      lastLogin: dbModel?.lastLogin,
      isSuperuser: dbModel?.isSuperuser,
      username: dbModel?.username,
      firstName: dbModel?.firstName,
      lastName: dbModel?.lastName,
      email: dbModel?.email,
      isStaff: dbModel?.isStaff,
      dateJoined: dbModel?.dateJoined,
      profileImage: dbModel?.profileImage,
      bio: dbModel?.bio,
      phoneNumber: dbModel?.phoneNumber,
      createdAt: dbModel?.createdAt,
      isActive: dbModel?.isActive,
      role: dbModel?.role,
      isPremium: dbModel?.isPremium,
      isBadged: dbModel?.isBadged,
      joinDate: dbModel?.joinDate,
      level: KnowledgeLevel.tryParse(dbModel?.level),
      liveQuizScore: dbModel?.liveQuizScore,
      isEmailVerified: dbModel?.isEmailVerified,
      coins: dbModel?.coins,
      referralCode: dbModel?.referralCode,
      telegramId: dbModel?.telegramId,
      invitedBy: dbModel?.invitedBy,
      groups: dbModel?.groups,
      userPermissions: dbModel?.userPermissions,
    );
  }

  static MyInfoDb toDb(MyInfoModel? model) {
    return MyInfoDb(
      id: model?.id,
      country: CountryHiveModel(
        id: model?.country?.id,
        name: model?.country?.name,
        code: model?.country?.code,
        lat: model?.country?.lat,
        lon: model?.country?.lon,
      ),
      region: RegionHiveModel(
        id: model?.region?.id,
        name: model?.region?.name,
        lat: model?.region?.lat,
        lon: model?.region?.lon,
        country: model?.region?.country,
      ),
      district: DistrictHiveModel(
        id: model?.district?.id,
        name: model?.district?.name,
        lat: model?.district?.lat,
        lon: model?.district?.lon,
        region: model?.district?.region,
      ),
      settlement: SettlementHiveModel(
        id: model?.settlement?.id,
        name: model?.settlement?.name,
        lat: model?.settlement?.lat,
        lon: model?.settlement?.lon,
        district: model?.settlement?.district,
      ),
      categoriesOfInterest: model?.categoriesOfInterest,
      coinPercentage: model?.coinPercentage,
      weeklyTestCount: WeeklyTestCountDb(
        dush: model?.weeklyTestCount?.dush,
        sesh: model?.weeklyTestCount?.sesh,
        chor: model?.weeklyTestCount?.chor,
        pay: model?.weeklyTestCount?.pay,
        jum: model?.weeklyTestCount?.jum,
        shan: model?.weeklyTestCount?.shan,
        yak: model?.weeklyTestCount?.yak,
      ),
      streakDay: model?.streakDay,
      testsSolved: model?.testsSolved,
      correctCount: model?.correctCount,
      wrongCount: model?.wrongCount,
      averageTime: model?.averageTime,
      lastLogin: model?.lastLogin,
      isSuperuser: model?.isSuperuser,
      username: model?.username,
      firstName: model?.firstName,
      lastName: model?.lastName,
      email: model?.email,
      isStaff: model?.isStaff,
      dateJoined: model?.dateJoined,
      profileImage: model?.profileImage,
      bio: model?.bio,
      phoneNumber: model?.phoneNumber,
      createdAt: model?.createdAt,
      isActive: model?.isActive,
      role: model?.role,
      isPremium: model?.isPremium,
      isBadged: model?.isBadged,
      joinDate: model?.joinDate,
      level: model?.level?.name,
      liveQuizScore: model?.liveQuizScore,
      isEmailVerified: model?.isEmailVerified,
      coins: model?.coins,
      referralCode: model?.referralCode,
      telegramId: model?.telegramId,
      invitedBy: model?.invitedBy,
      groups: model?.groups,
      userPermissions: model?.userPermissions,
    );
  }

  @override
  List<Object?> get props => [
    id,
    country,
    region,
    district,
    settlement,
    categoriesOfInterest,
    coinPercentage,
    weeklyTestCount,
    streakDay,
    testsSolved,
    correctCount,
    wrongCount,
    averageTime,
    lastLogin,
    isSuperuser,
    username,
    firstName,
    lastName,
    email,
    isStaff,
    dateJoined,
    profileImage,
    bio,
    phoneNumber,
    createdAt,
    isActive,
    role,
    isPremium,
    isBadged,
    joinDate,
    level,
    liveQuizScore,
    isEmailVerified,
    coins,
    referralCode,
    telegramId,
    invitedBy,
    groups,
    userPermissions,
  ];
}
