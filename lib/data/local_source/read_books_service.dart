import 'dart:async';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/data/local_source/entities/read_book_entity.dart';

import 'package:hive/hive.dart';

@injectable
class ReadBooksService {
  static const String _boxName = 'readBookBox';

  LazyBox<ReadBookEntity>? _box;

  ReadBooksService(this._box){ init(); }

  Future<void> init() async {
    Hive.registerAdapter(ReadBookEntityAdapter());
    _box ??= await Hive.openLazyBox<ReadBookEntity>(_boxName);
  }

  LazyBox<ReadBookEntity> get box {
    if (_box == null) {
      throw Exception('ReadBooksService not initialized. Call init() first.');
    }
    return _box!;
  }

  /// CREATE / UPDATE (Hive put is already optimized)
  Future<void> save(ReadBookEntity book) async {
    await box.put(book.id, book);
  }

  /// READ single
  Future<ReadBookEntity?> get(int id) {
    return box.get(id);
  }

  /// READ all (parallel fetch)
  Future<List<ReadBookEntity>> getAll() async {
    final keys = box.keys.cast<int>().toList();
    final books = await Future.wait(keys.map(box.get));
    return books.whereType<ReadBookEntity>().toList();
  }

  /// DELETE
  Future<void> delete(int id) {
    return box.delete(id);
  }

  /// CHECK exists (O(1))
  bool exists(int id) {
    return box.containsKey(id);
  }

  /// CLEAR
  Future<void> clear() {
    return box.clear();
  }

  /// COUNT
  int count() {
    return box.length;
  }
}