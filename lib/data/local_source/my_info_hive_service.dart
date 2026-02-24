import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart' hide HiveError;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/data/local_source/entities/my_info_db.dart';
import 'package:testabd/data/remote_source/account/models/my_info_response.dart';

@singleton
class MyInfoHiveService {
  static const String _boxName = 'myInfoBox';
  static const String _key = 'currentUser';

  late LazyBox<MyInfoDb> _box;

  final StreamController<MyInfoDb?> _controller =
          BehaviorSubject<MyInfoDb?>.seeded(null);

  MyInfoHiveService() { init(); }

  Future<void> init() async {
    try {
      Hive.registerAdapter(MyInfoDbAdapter());
      Hive.registerAdapter(WeeklyTestCountDbAdapter());
      Hive.registerAdapter(CountryHiveModelAdapter());
      Hive.registerAdapter(RegionHiveModelAdapter());
      Hive.registerAdapter(DistrictHiveModelAdapter());
      Hive.registerAdapter(SettlementHiveModelAdapter());
      _box = await Hive.openLazyBox<MyInfoDb>(_boxName);

      final data = await getInfo();

      if (!_controller.isClosed) {
        _controller.add(data);
      }

      _box.watch(key: _key).listen((event) {
        if (!_controller.isClosed) {
          _controller.add(event.value as MyInfoDb?);
        }
      });
    } catch (e, stackTrace) {
      throw Exception('Failed to initialize UserDbService: $e');
    }
  }

  Stream<MyInfoDb?> get userStream => _controller.stream;

  Future<void> saveMyInfo(MyInfoDb myInfo) async {
    try {
      await _ensureBoxOpen();
      await _box.put(_key, myInfo);
    } catch (e, stackTrace) {
      throw HiveError('Failed to save user: $e', stackTrace: stackTrace);
    }
  }

  Future<MyInfoDb?> getInfo() async {
    try {
      await _ensureBoxOpen();
      return await _box.get(_key);
    } catch (e, stackTrace) {
      throw HiveError(
        'Failed to retrieve user: $e',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> updateMyInfo(MyInfoDb updatedInfo) async {
    await saveMyInfo(updatedInfo);
  }

  Future<void> clear() async {
    try {
      await _ensureBoxOpen();
      await _box.clear();
    } catch (e, stackTrace) {
      throw HiveError('Failed to clear user: $e', stackTrace: stackTrace);
    }
  }

  Future<void> close() async {
    try {
      await _box.close();
      await _controller.close();
    } catch (e, stackTrace) {
      throw HiveError(
        'Failed to close UserDbService: $e',
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _ensureBoxOpen() async {
    if (!_box.isOpen) {
      _box = await Hive.openLazyBox<MyInfoDb>(_boxName);
    }
  }
}
