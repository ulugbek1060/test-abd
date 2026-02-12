import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz'),
  ];

  /// No description provided for @error_network_title.
  ///
  /// In uz, this message translates to:
  /// **'Internet mavjud emas'**
  String get error_network_title;

  /// No description provided for @error_timeout_title.
  ///
  /// In uz, this message translates to:
  /// **'So‘rov vaqti tugadi'**
  String get error_timeout_title;

  /// No description provided for @error_bad_request_title.
  ///
  /// In uz, this message translates to:
  /// **'Noto‘g‘ri so‘rov'**
  String get error_bad_request_title;

  /// No description provided for @error_unauthorized_title.
  ///
  /// In uz, this message translates to:
  /// **'Ruxsat yo‘q'**
  String get error_unauthorized_title;

  /// No description provided for @error_not_found_title.
  ///
  /// In uz, this message translates to:
  /// **'Topilmadi'**
  String get error_not_found_title;

  /// No description provided for @error_server_title.
  ///
  /// In uz, this message translates to:
  /// **'Server xatosi'**
  String get error_server_title;

  /// No description provided for @error_storage_title.
  ///
  /// In uz, this message translates to:
  /// **'Xotira xatosi'**
  String get error_storage_title;

  /// No description provided for @error_unknown_title.
  ///
  /// In uz, this message translates to:
  /// **'Kutilmagan xatolik'**
  String get error_unknown_title;

  /// No description provided for @languageEnglish.
  ///
  /// In uz, this message translates to:
  /// **'Inglizcha'**
  String get languageEnglish;

  /// No description provided for @languageUzbek.
  ///
  /// In uz, this message translates to:
  /// **'O‘zbekcha'**
  String get languageUzbek;

  /// No description provided for @languageRussian.
  ///
  /// In uz, this message translates to:
  /// **'Ruscha'**
  String get languageRussian;

  /// No description provided for @en.
  ///
  /// In uz, this message translates to:
  /// **'En'**
  String get en;

  /// No description provided for @ru.
  ///
  /// In uz, this message translates to:
  /// **'Ru'**
  String get ru;

  /// No description provided for @uz.
  ///
  /// In uz, this message translates to:
  /// **'Uz'**
  String get uz;

  /// No description provided for @knowledge_level_none.
  ///
  /// In uz, this message translates to:
  /// **'Без опыта'**
  String get knowledge_level_none;

  /// No description provided for @knowledge_level_beginner.
  ///
  /// In uz, this message translates to:
  /// **'Новичок'**
  String get knowledge_level_beginner;

  /// No description provided for @knowledge_level_basic.
  ///
  /// In uz, this message translates to:
  /// **'Базовый'**
  String get knowledge_level_basic;

  /// No description provided for @knowledge_level_intermediate.
  ///
  /// In uz, this message translates to:
  /// **'Средний'**
  String get knowledge_level_intermediate;

  /// No description provided for @knowledge_level_advanced.
  ///
  /// In uz, this message translates to:
  /// **'Продвинутый'**
  String get knowledge_level_advanced;

  /// No description provided for @knowledge_level_expert.
  ///
  /// In uz, this message translates to:
  /// **'Эксперт'**
  String get knowledge_level_expert;

  /// No description provided for @singleSelect.
  ///
  /// In uz, this message translates to:
  /// **'Bitta tanlov'**
  String get singleSelect;

  /// No description provided for @multipleSelect.
  ///
  /// In uz, this message translates to:
  /// **'Bir nechta tanlov'**
  String get multipleSelect;

  /// No description provided for @trueFalse.
  ///
  /// In uz, this message translates to:
  /// **'To‘g‘ri yoki Noto‘g‘ri'**
  String get trueFalse;

  /// No description provided for @textQuestion.
  ///
  /// In uz, this message translates to:
  /// **'Matnli javob'**
  String get textQuestion;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
