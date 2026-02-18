// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/services/session_service.dart' as _i371;
import '../core/services/token_service.dart' as _i792;
import '../core/utils/app_message_handler.dart' as _i877;
import '../core/utils/app_mode_service.dart' as _i555;
import '../core/utils/dio_interceptor.dart' as _i900;
import '../core/utils/follow_listeners.dart' as _i244;
import '../core/utils/language_service.dart' as _i456;
import '../data/local_source/my_info_hive_service.dart' as _i656;
import '../data/remote_source/account/account_source.dart' as _i65;
import '../data/remote_source/account/ws_leaderboard_source.dart' as _i259;
import '../data/remote_source/account/ws_notifications_source.dart' as _i1067;
import '../data/remote_source/auth/auth_source.dart' as _i142;
import '../data/remote_source/quiz/quiz_source.dart' as _i792;
import '../data/repository/account_repository_impl.dart' as _i317;
import '../data/repository/auth_repository_impl.dart' as _i461;
import '../data/repository/quiz_repository_impl.dart' as _i75;
import '../domain/account/account_repository.dart' as _i575;
import '../domain/auth/auth_repository.dart' as _i893;
import '../domain/quiz/quiz_repository.dart' as _i156;
import '../features/auth/forgotpswd/forgot_pswd_cubit.dart' as _i36;
import '../features/auth/login/login_cubit.dart' as _i958;
import '../features/auth/register/register_cubit.dart' as _i163;
import '../features/home/home_cubit.dart' as _i639;
import '../features/home/leaderboard_cubit.dart' as _i279;
import '../features/profile/bookmark_questions_cubit.dart' as _i137;
import '../features/profile/create_block_cubit.dart' as _i341;
import '../features/profile/create_question_cubit.dart' as _i84;
import '../features/profile/my_block_detail_cubit.dart' as _i296;
import '../features/profile/my_question_detail_cubit.dart' as _i537;
import '../features/profile/profile_connection_cubit.dart' as _i570;
import '../features/profile/profile_cubit.dart' as _i760;
import '../features/profile/settings/change_pswd_cubit.dart' as _i186;
import '../features/profile/settings/edit_profile_cubit.dart' as _i523;
import '../features/profile/settings/personal_info_cubit.dart' as _i688;
import '../features/profile/settings/referrals_cubit.dart' as _i168;
import '../features/profile/settings/regional_settings_cubit.dart' as _i877;
import '../features/users/user_connection_cubit.dart' as _i297;
import '../features/users/user_profile_cubit.dart' as _i445;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => appModule.getSharedPrefs(),
      preResolve: true,
    );
    gh.singleton<_i656.MyInfoHiveService>(() => _i656.MyInfoHiveService());
    gh.lazySingleton<_i361.BaseOptions>(
        () => appModule.provideDioBaseOptions());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => appModule.providePrettyDioLogger());
    gh.singleton<_i877.AppMessageHandler>(() => _i877.AppMessenger());
    gh.singleton<_i760.UpdateListener>(
      () => _i760.ProfileBlockUpdater(),
      instanceName: 'ProfileBlockUpdater',
    );
    gh.lazySingleton<_i244.ConnectionFollowEventListener>(
      () => _i244.ProfileFollowListener(),
      instanceName: 'ProfileFollowListener',
      dispose: _i244.disposeMethod,
    );
    gh.lazySingleton<_i244.ConnectionFollowEventListener>(
      () => _i244.UserFollowListener(),
      instanceName: 'UserFollowListener',
      dispose: _i244.disposeMethod,
    );
    gh.lazySingleton<_i244.ConnectionFollowEventListener>(
      () => _i244.LeaderboardFollowListener(),
      instanceName: 'LeaderboardFollowListener',
      dispose: _i244.disposeMethod,
    );
    gh.singleton<_i792.TokenService>(
        () => _i792.SharedPrefsTokenService(gh<_i460.SharedPreferences>()));
    gh.singleton<_i456.LanguageService>(
        () => _i456.LanguageServiceImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i760.UpdateListener>(
      () => _i760.ProfileQuestionsUpdater(),
      instanceName: 'ProfileQuestionsUpdater',
    );
    gh.lazySingleton<_i555.AppSettingsService>(
        () => _i555.AppSettingsServiceImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i371.SessionService>(
        () => _i371.SessionServiceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1067.WSNotificationsSource>(
        () => _i1067.WSNotificationsSourceImpl());
    gh.lazySingleton<_i244.ConnectionFollowEventListener>(
      () => _i244.ConnectionFollowListener(),
      instanceName: 'ConnectionFollowListener',
      dispose: _i244.disposeMethod,
    );
    gh.singleton<_i259.LeaderboardSocketService>(
        () => _i259.LeaderboardSocketServiceImpl(gh<_i792.TokenService>()));
    gh.singleton<_i900.DioInterceptor>(
        () => _i900.DioInterceptor(gh<_i792.TokenService>()));
    gh.factory<_i361.Dio>(() => appModule.provideDio(
          gh<_i361.BaseOptions>(),
          gh<_i900.DioInterceptor>(),
          gh<_i528.PrettyDioLogger>(),
        ));
    gh.factory<_i792.QuizSource>(() => _i792.QuizSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i142.AuthSource>(() => _i142.AuthSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i65.AccountSource>(
        () => _i65.AccountSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i259.WsLeaderboardSource>(
        () => _i259.WsLeaderboardSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i156.QuizRepository>(
        () => _i75.QuizRepositoryImpl(gh<_i792.QuizSource>()));
    gh.singleton<_i893.AuthRepository>(() => _i461.AuthRepositoryImpl(
          gh<_i142.AuthSource>(),
          gh<_i371.SessionService>(),
          gh<_i792.TokenService>(),
        ));
    gh.lazySingleton<_i575.LeaderboardRepository>(() =>
        _i317.LeaderboardRepositoryImpl(gh<_i259.LeaderboardSocketService>()));
    gh.factoryParam<_i296.MyBlockDetailCubit, int, dynamic>((
      id,
      _,
    ) =>
        _i296.MyBlockDetailCubit.create(
          id,
          gh<_i156.QuizRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factoryParam<_i84.CreateQuestionCubit, int?, dynamic>((
      questionId,
      _,
    ) =>
        _i84.CreateQuestionCubit(
          questionId,
          gh<_i156.QuizRepository>(),
          gh<_i877.AppMessageHandler>(),
          gh<_i760.UpdateListener>(instanceName: 'ProfileQuestionsUpdater'),
        ));
    gh.factory<_i137.BookmarkQuestionsCubit>(() => _i137.BookmarkQuestionsCubit(
          gh<_i156.QuizRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.lazySingleton<_i575.AccountRepository>(() => _i317.AccountRepositoryImpl(
          gh<_i65.AccountSource>(),
          gh<_i656.MyInfoHiveService>(),
          gh<_i259.WsLeaderboardSource>(),
        ));
    gh.factoryParam<_i341.CreateBlockCubit, int?, dynamic>((
      blockId,
      _,
    ) =>
        _i341.CreateBlockCubit(
          blockId,
          gh<_i156.QuizRepository>(),
          gh<_i877.AppMessageHandler>(),
          gh<_i760.UpdateListener>(instanceName: 'ProfileBlockUpdater'),
        ));
    gh.factory<_i36.ForgotPswdCubit>(
        () => _i36.ForgotPswdCubit(gh<_i893.AuthRepository>()));
    gh.factory<_i523.EditProfileCubit>(
        () => _i523.EditProfileCubit(gh<_i893.AuthRepository>()));
    gh.factory<_i163.RegisterCubit>(
        () => _i163.RegisterCubit(gh<_i893.AuthRepository>()));
    gh.factory<_i958.LoginCubit>(
        () => _i958.LoginCubit(gh<_i893.AuthRepository>()));
    gh.factory<_i186.ChangePswdCubit>(() => _i186.ChangePswdCubit(
          gh<_i575.AccountRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factoryParam<_i537.MyQuestionDetailCubit, int, dynamic>((
      questionId,
      _,
    ) =>
        _i537.MyQuestionDetailCubit(
          questionId,
          gh<_i877.AppMessageHandler>(),
          gh<_i156.QuizRepository>(),
        ));
    gh.factoryParam<_i445.UserProfileCubit, String, dynamic>((
      username,
      _,
    ) =>
        _i445.UserProfileCubit.create(
          username,
          gh<_i575.AccountRepository>(),
          gh<_i156.QuizRepository>(),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'ConnectionFollowListener'),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'UserFollowListener'),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'LeaderboardFollowListener'),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'ProfileFollowListener'),
        ));
    gh.factory<_i570.ProfileConnectionCubit>(() => _i570.ProfileConnectionCubit(
          gh<_i575.AccountRepository>(),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'ProfileFollowListener'),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factory<_i760.ProfileCubit>(() => _i760.ProfileCubit(
          gh<_i575.AccountRepository>(),
          gh<_i156.QuizRepository>(),
          gh<_i877.AppMessageHandler>(),
          gh<_i760.UpdateListener>(instanceName: 'ProfileQuestionsUpdater'),
          gh<_i760.UpdateListener>(instanceName: 'ProfileBlockUpdater'),
        ));
    gh.factory<_i279.LeaderboardCubit>(() => _i279.LeaderboardCubit(
          gh<_i575.AccountRepository>(),
          gh<_i575.LeaderboardRepository>(),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'LeaderboardFollowListener'),
        ));
    gh.factoryParam<_i297.UserConnectionCubit, int, dynamic>((
      userId,
      _,
    ) =>
        _i297.UserConnectionCubit.create(
          userId,
          gh<_i575.AccountRepository>(),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'ConnectionFollowListener'),
          gh<_i244.ConnectionFollowEventListener>(
              instanceName: 'UserFollowListener'),
        ));
    gh.factory<_i688.PersonalInfoCubit>(() => _i688.PersonalInfoCubit(
          gh<_i575.AccountRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factory<_i877.RegionalSettingsCubit>(() => _i877.RegionalSettingsCubit(
          gh<_i575.AccountRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factory<_i168.ReferralsCubit>(() => _i168.ReferralsCubit(
          gh<_i575.AccountRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    gh.factory<_i639.HomeCubit>(() => _i639.HomeCubit(
          gh<_i156.QuizRepository>(),
          gh<_i575.AccountRepository>(),
          gh<_i877.AppMessageHandler>(),
        ));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
