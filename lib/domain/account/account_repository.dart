import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/domain/account/entities/country_model.dart';
import 'package:testabd/domain/account/entities/district_model.dart';
import 'package:testabd/domain/account/entities/leaderboard_model.dart';
import 'package:testabd/domain/account/entities/my_info_model.dart';
import 'package:testabd/domain/account/entities/notification_model.dart';
import 'package:testabd/domain/account/entities/personal_info_dto.dart';
import 'package:testabd/domain/account/entities/referral_list_model.dart';
import 'package:testabd/domain/account/entities/region_model.dart';
import 'package:testabd/domain/account/entities/settlement_model.dart';
import 'package:testabd/domain/account/entities/user_connections_model.dart';
import 'package:testabd/domain/account/entities/user_profile_model.dart';

abstract class AccountRepository {
  Stream<MyInfoModel?> get userInfoStream;

  Future<Either<Messenger, MyInfoModel>> fetchMyInfo();

  Future<Either<Messenger, List<NotificationModel>>> getNotifications();

  Future<Either<Messenger, Unit>> getStories();

  Future<Either<Messenger, UserProfileModel>> getUserProfile(
    String username,
  );

  Future<Either<Messenger, UserConnectionsModel>> getUserConnections(
    int userId,
  );

  Future<Either<Messenger, String>> followUser(int userId);

  Future<Either<Messenger, PagedData<LeaderboardUser>>> getLeaderboard(
    int page,
    int pageSize,
  );

  Future<Either<Messenger, Unit>> updatePersonalInfo(
    PersonalInfoDto personalInfoDto,
  );

  Future<Either<Messenger, List<CountryModel>>> getCountries();

  Future<Either<Messenger, List<DistrictModel>>> getDistricts(int? regionId);

  Future<Either<Messenger, List<RegionModel>>> getRegions(int? countryId);

  Future<Either<Messenger, List<SettlementModel>>> getSettlements(
    int? districtId,
  );

  Future<Either<Messenger, ReferralListModel>> getReferralsList(int page);

  Future<dynamic> updateProfileImage(String path);

  Future<Either<Messenger, String?>> changePassword({
    required String oldPswd,
    required String newPswd,
    required String confirmPswd,
  });

  Future<Either<Messenger, PagedData<dynamic>>> searchAccount({
    required String query,
    required int page,
    required int pageSize,
  });
}

abstract class LeaderboardRepository {
  Future<void> openWebSocket(Function(dynamic data) dataReceived);

  void closeWebSocket();
}
