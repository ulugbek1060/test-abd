import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:testabd/data/local_source/entities/read_book_entity.dart';
import 'package:hive/hive.dart';

@injectable
class ReadBooksService {
  static const String _boxName = 'readBookBox';

  LazyBox<ReadBookEntity>? _box;

  ReadBooksService() {
    init();
  }

  Future<void> init() async {
    try {
      if (!Hive.isAdapterRegistered(6)) {
        Hive.registerAdapter(ReadBookEntityAdapter());
      }

      await _ensureBoxOpen();
    } catch (e) {
      throw Exception('Failed to initialize ReadBooksService: $e');
    }
  }

  Future<void> save(ReadBookEntity book) async {
    await _ensureBoxOpen();
    await _box!.put(book.id, book);
  }

  Future<ReadBookEntity?> get(int id) async {
    await _ensureBoxOpen();
    return _box!.get(id);
  }

  Future<List<ReadBookEntity>> getAll() async {
    await _ensureBoxOpen();

    final keys = _box!.keys.cast<int>().toList();
    final books = await Future.wait(keys.map(_box!.get));

    return books.whereType<ReadBookEntity>().toList();
  }

  Future<void> delete(int id) async {
    await _ensureBoxOpen();
    await _box!.delete(id);
  }

  Future<bool> exists(int id) async {
    await _ensureBoxOpen();
    return _box!.containsKey(id);
  }

  Future<void> clear() async {
    await _ensureBoxOpen();
    await _box!.clear();
  }

  Future<int> count() async {
    await _ensureBoxOpen();
    return _box!.length;
  }

  Future<void> _ensureBoxOpen() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openLazyBox<ReadBookEntity>(_boxName);
    }
  }
}