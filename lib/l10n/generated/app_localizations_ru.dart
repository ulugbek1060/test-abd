// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get error_network_title => 'Нет подключения к интернету';

  @override
  String get error_timeout_title => 'Время ожидания истекло';

  @override
  String get error_bad_request_title => 'Неверный запрос';

  @override
  String get error_unauthorized_title => 'Нет доступа';

  @override
  String get error_not_found_title => 'Не найдено';

  @override
  String get error_server_title => 'Ошибка сервера';

  @override
  String get error_storage_title => 'Ошибка хранилища';

  @override
  String get error_unknown_title => 'Неизвестная ошибка';

  @override
  String get languageEnglish => 'Английский';

  @override
  String get languageUzbek => 'Узбекский';

  @override
  String get languageRussian => 'Русский';

  @override
  String get en => 'En';

  @override
  String get ru => 'Ру';

  @override
  String get uz => 'Уз';

  @override
  String get knowledge_level_none => 'Без опыта';

  @override
  String get knowledge_level_beginner => 'Новичок';

  @override
  String get knowledge_level_basic => 'Базовый';

  @override
  String get knowledge_level_intermediate => 'Средний';

  @override
  String get knowledge_level_advanced => 'Продвинутый';

  @override
  String get knowledge_level_expert => 'Эксперт';
}
