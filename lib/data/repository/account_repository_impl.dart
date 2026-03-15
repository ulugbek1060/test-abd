import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/core/utils/paged_data.dart';
import 'package:testabd/data/local_source/my_info_hive_service.dart';
import 'package:testabd/data/remote_source/account/account_source.dart';
import 'package:testabd/data/remote_source/account/models/change_pswd_request.dart';
import 'package:testabd/data/remote_source/account/ws_leaderboard_source.dart';
import 'package:testabd/domain/account/account_repository.dart';
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
import 'package:testabd/main.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  final AccountSource _accountSource;
  final MyInfoHiveService _hiveService;
  final WsLeaderboardSource _leaderboardSource;

  AccountRepositoryImpl(
    this._accountSource,
    this._hiveService,
    this._leaderboardSource,
  );

  @override
  Stream<MyInfoModel?> get userInfoStream =>
      _hiveService.userStream.map((e) => MyInfoModel.fromDb(e));

  @override
  Future<Either<AppException, MyInfoModel>> fetchMyInfo() async {
    try {
      final result = await _accountSource.getUserInfo();
      final model = MyInfoModel.fromResponse(result);
      final dbModel = MyInfoModel.toDb(model);
      _hiveService.saveMyInfo(dbModel);
      return Right(model);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<NotificationModel>>>
  getNotifications() async {
    try {
      final result = await _accountSource.notifications();
      final list = result.map(NotificationModel.fromResponse).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, Unit>> getStories() async {
    try {
      final result = await _accountSource.getStories();
      logger.d(result);
      return Right(unit);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, UserProfileModel>> getUserProfile(
    String username,
  ) async {
    try {
      final result = await _accountSource.getProfile(username);
      return Right(UserProfileModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, UserConnectionsModel>> getUserConnections(
    int userId,
  ) async {
    try {
      final result = await _accountSource.getFollowers(userId);
      return Right(UserConnectionsModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, String>> followUser(int userId) async {
    try {
      final result = await _accountSource.followUser(userId);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, PagedData<LeaderboardUser>>> getLeaderboard(
    int page,
    int pageSize,
  ) async {
    try {
      final result = await _leaderboardSource.getLeaderboard(page, pageSize);
      final data = PagedData(
        data: result.results.map(LeaderboardUser.fromResponse).toList(),
        next: result.next,
        previous: result.previous,
        count: result.count,
      );
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, Unit>> updatePersonalInfo(
    PersonalInfoDto personalInfoDto,
  ) async {
    try {
      final result = await _accountSource.updateMyInfo(
        personalInfoDto.toRequestBody(),
      );
      final model = MyInfoModel.fromResponse(result);
      final dbModel = MyInfoModel.toDb(model);
      _hiveService.saveMyInfo(dbModel);
      return Right(unit);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<CountryModel>>> getCountries() async {
    try {
      final result = await _accountSource.getCountries();
      final list = result.map((e) => CountryModel.fromResponse(e)).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<RegionModel>>> getRegions(
    int? countryId,
  ) async {
    try {
      final result = await _accountSource.getRegions(countryId);
      final list = result.map((e) => RegionModel.fromResponse(e)).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<DistrictModel>>> getDistricts(
    int? regionId,
  ) async {
    try {
      final result = await _accountSource.getDistricts(regionId);
      final list = result.map((e) => DistrictModel.fromResponse(e)).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, List<SettlementModel>>> getSettlements(
    int? districtId,
  ) async {
    try {
      final result = await _accountSource.getSettlements(districtId);
      final list = result.map((e) => SettlementModel.fromResponse(e)).toList();
      return Right(list);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, ReferralListModel>> getReferralsList(
    int page,
  ) async {
    try {
      final result = await _accountSource.getReferralsList();
      return Right(ReferralListModel.fromResponse(result));
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<dynamic> updateProfileImage(String path) async {
    try {
      final result = await _accountSource.uploadUserImage(path);
      // final models = MyInfoModel.fromResponse(result);
      // final dbModel = MyInfoModel.toDb(models);
      // _hiveService.saveMyInfo(dbModel);
      return Right(result);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, String?>> changePassword({
    required String oldPswd,
    required String newPswd,
    required String confirmPswd,
  }) async {
    try {
      final result = await _accountSource.updatePassword(
        ChangePswdRequest(
          oldPassword: oldPswd,
          newPassword: newPswd,
          confirmPassword: confirmPswd,
        ),
      );
      return Right(result.detail);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<AppException, PagedData<dynamic>>> searchAccount({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    try {
      final result = await _accountSource.search(query, page, pageSize);
      final data = PagedData(data: result);
      return Right(data);
    } on AppException catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(UnknownException(e.toString(), stackTrace: stackTrace));
    }
  }
}

@LazySingleton(as: LeaderboardRepository)
class LeaderboardRepositoryImpl implements LeaderboardRepository {
  final LeaderboardSocketService _service;

  LeaderboardRepositoryImpl(this._service);

  @override
  void closeWebSocket() => _service.closeWebSocket();

  @override
  Future<void> openWebSocket(Function(dynamic data) dataReceived) async {
    _service.connectWebSocket(dataReceived);
  }
}
