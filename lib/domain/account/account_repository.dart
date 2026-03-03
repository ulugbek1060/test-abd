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
  Future<Either<AppException, MyInfoModel>> fetchMyInfo();
  Future<Either<AppException, List<NotificationModel>>> getNotifications();
  Future<Either<AppException, Unit>> getStories();
  Future<Either<AppException, UserProfileModel>> getUserProfile(String username);
  Future<Either<AppException, UserConnectionsModel>> getUserConnections(int userId);
  Future<Either<AppException, String>> followUser(int userId);
  Future<Either<AppException, PagedData<LeaderboardUser>>> getLeaderboard(int page, int pageSize);
  Future<Either<AppException, Unit>> updatePersonalInfo(PersonalInfoDto personalInfoDto);
  Future<Either<AppException, List<CountryModel>>> getCountries();
  Future<Either<AppException, List<DistrictModel>>> getDistricts(int? regionId);
  Future<Either<AppException, List<RegionModel>>> getRegions(int? countryId);
  Future<Either<AppException, List<SettlementModel>>> getSettlements(int? districtId);
  Future<Either<AppException, ReferralListModel>> getReferralsList(int page);
  Future<dynamic> updateProfileImage(String path);
  Future<Either<AppException, String?>> changePassword({
    required String oldPswd,
    required String newPswd,
    required String confirmPswd,
  });
}

abstract class LeaderboardRepository {
  Future<void> openWebSocket(Function(dynamic data) dataReceived);
  void closeWebSocket();
}
