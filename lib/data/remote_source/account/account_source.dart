import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/remote_source/account/model/change_pswd_request.dart';
import 'package:testabd/data/remote_source/account/model/change_pswd_response.dart';
import 'package:testabd/data/remote_source/account/model/country_item_response.dart';
import 'package:testabd/data/remote_source/account/model/district_item_response.dart';
import 'package:testabd/data/remote_source/account/model/notifications_response.dart';
import 'package:testabd/data/remote_source/account/model/referrals_list_response.dart';
import 'package:testabd/data/remote_source/account/model/region_item_response.dart';
import 'package:testabd/data/remote_source/account/model/settlement_item_response.dart';
import 'package:testabd/data/remote_source/account/model/user_connections_response.dart';
import 'package:testabd/data/remote_source/account/model/user_profile_response.dart';
import 'package:testabd/data/remote_source/account/model/my_info_response.dart';

abstract class AccountSource {
  Future<MyInfoResponse> getUserInfo();

  Future<List<NotificationsResponse>> notifications();

  Future<dynamic> getStories();

  Future<UserProfileResponse> getProfile(String username);

  Future<UserConnectionsResponse> getFollowers(int userId);

  Future<String> followUser(int userId);

  Future<MyInfoResponse> updateMyInfo(Map<String, dynamic> data);

  Future<List<CountryItemResponse>> getCountries();

  Future<ReferralsListResponse> getReferralsList();

  Future<List<RegionItemResponse>> getRegions(int? countryId);

  Future<List<DistrictItemResponse>> getDistricts(int? regionId);

  Future<List<SettlementItemResponse>> getSettlements(int? districtId);

  Future<dynamic> uploadUserImage(String path);

  Future<ChangePswdResponse> updatePassword(ChangePswdRequest requestData);

  Future<dynamic> search(String? query);
}

@Injectable(as: AccountSource)
class AccountSourceImpl implements AccountSource {
  final Dio _dio;

  AccountSourceImpl(this._dio);

  @override
  Future<MyInfoResponse> getUserInfo() async {
    try {
      final response = await _dio.get("/accounts/me/");
      return MyInfoResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<NotificationsResponse>> notifications() async {
    try {
      final response = await _dio.get("/accounts/notifications/");
      final List<NotificationsResponse> notifications = (response.data as List)
          .map((e) => NotificationsResponse.fromJson(e))
          .toList();
      return notifications;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<dynamic> getStories() async {
    try {
      final response = await _dio.get("/account/stories/");
      return response.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<UserProfileResponse> getProfile(String username) async {
    try {
      final response = await _dio.get("/accounts/profile/$username");
      return UserProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<UserConnectionsResponse> getFollowers(int userId) async {
    try {
      final response = await _dio.get("/accounts/followers/$userId");
      return UserConnectionsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String> followUser(int userId) async {
    try {
      final response = await _dio.post("/accounts/followers/$userId/toggle/");
      return response.data.toString();
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<MyInfoResponse> updateMyInfo(Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch("/accounts/me/update/", data: data);
      return MyInfoResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<CountryItemResponse>> getCountries() async {
    try {
      final response = await _dio.get("/accounts/countries/");
      return (response.data as List<dynamic>)
          .map((e) => CountryItemResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<RegionItemResponse>> getRegions(int? countryId) async {
    try {
      final response = await _dio.get("/accounts/regions/$countryId/");
      return (response.data as List<dynamic>)
          .map((e) => RegionItemResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<DistrictItemResponse>> getDistricts(int? regionId) async {
    try {
      final response = await _dio.get("/accounts/districts/$regionId/");
      return (response.data as List<dynamic>)
          .map((e) => DistrictItemResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<SettlementItemResponse>> getSettlements(int? districtId) async {
    try {
      final response = await _dio.get("/accounts/settlements/$districtId/");
      return (response.data as List<dynamic>)
          .map((e) => SettlementItemResponse.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<ReferralsListResponse> getReferralsList() async {
    try {
      final response = await _dio.get("/accounts/my/referrals-list/");
      return ReferralsListResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<dynamic> uploadUserImage(String path) async {
    try {
      final formData = FormData.fromMap({
        'profile_image': await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        ),
      });
      final response = await _dio.put('/accounts/me/update/', data: formData);
      return response.data;
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<ChangePswdResponse> updatePassword(
    ChangePswdRequest requestData,
  ) async {
    try {
      final response = await _dio.post(
        '/accounts/me/change-password/',
        data: requestData.toJson(),
      );
      return ChangePswdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.handleDioException();
    } catch (e, stackTrace) {
      throw UnknownException(e.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<dynamic> search(String? query) async {}
}
