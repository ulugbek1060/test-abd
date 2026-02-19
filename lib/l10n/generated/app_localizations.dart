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

  /// No description provided for @followed.
  ///
  /// In uz, this message translates to:
  /// **'Obuna bo‘lingan'**
  String get followed;

  /// No description provided for @follow.
  ///
  /// In uz, this message translates to:
  /// **'Obuna bo‘lish'**
  String get follow;

  /// No description provided for @shareProfile.
  ///
  /// In uz, this message translates to:
  /// **'Profilni ulashish'**
  String get shareProfile;

  /// No description provided for @editProfile.
  ///
  /// In uz, this message translates to:
  /// **'Profilni tahrirlash'**
  String get editProfile;

  /// No description provided for @coins.
  ///
  /// In uz, this message translates to:
  /// **'Tangalar'**
  String get coins;

  /// No description provided for @bookmarkedQuestions.
  ///
  /// In uz, this message translates to:
  /// **'Saqlangan savollar'**
  String get bookmarkedQuestions;

  /// No description provided for @addQuestion.
  ///
  /// In uz, this message translates to:
  /// **'Savol qo‘shish'**
  String get addQuestion;

  /// No description provided for @home.
  ///
  /// In uz, this message translates to:
  /// **'Bosh sahifa'**
  String get home;

  /// No description provided for @search.
  ///
  /// In uz, this message translates to:
  /// **'Qidirish'**
  String get search;

  /// No description provided for @library.
  ///
  /// In uz, this message translates to:
  /// **'Kutubxona'**
  String get library;

  /// No description provided for @profile.
  ///
  /// In uz, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @questions.
  ///
  /// In uz, this message translates to:
  /// **'Savollar'**
  String get questions;

  /// No description provided for @blockTest.
  ///
  /// In uz, this message translates to:
  /// **'Testni bloklash'**
  String get blockTest;

  /// No description provided for @books.
  ///
  /// In uz, this message translates to:
  /// **'Kitoblar'**
  String get books;

  /// No description provided for @followers.
  ///
  /// In uz, this message translates to:
  /// **'Obunachilar'**
  String get followers;

  /// No description provided for @following.
  ///
  /// In uz, this message translates to:
  /// **'Obuna bo‘linganlar'**
  String get following;

  /// No description provided for @totalTests.
  ///
  /// In uz, this message translates to:
  /// **'Jami testlar'**
  String get totalTests;

  /// No description provided for @correctAnswers.
  ///
  /// In uz, this message translates to:
  /// **'To‘g‘ri javoblar'**
  String get correctAnswers;

  /// No description provided for @wrongAnswers.
  ///
  /// In uz, this message translates to:
  /// **'Noto‘g‘ri javoblar'**
  String get wrongAnswers;

  /// No description provided for @accuracy.
  ///
  /// In uz, this message translates to:
  /// **'Aniqlik'**
  String get accuracy;

  /// No description provided for @quizPerformance.
  ///
  /// In uz, this message translates to:
  /// **'Test natijalari'**
  String get quizPerformance;

  /// No description provided for @profileInformation.
  ///
  /// In uz, this message translates to:
  /// **'Profil ma\'lumotlari'**
  String get profileInformation;

  /// No description provided for @personalInformation.
  ///
  /// In uz, this message translates to:
  /// **'Shaxsiy ma\'lumotlar'**
  String get personalInformation;

  /// No description provided for @updatePersonalInfoDescription.
  ///
  /// In uz, this message translates to:
  /// **'Ismingiz, email manzilingiz, telefon raqamingiz va biografik ma\'lumotlaringizni yangilang.'**
  String get updatePersonalInfoDescription;

  /// No description provided for @location.
  ///
  /// In uz, this message translates to:
  /// **'Joylashuv'**
  String get location;

  /// No description provided for @regionalSettings.
  ///
  /// In uz, this message translates to:
  /// **'Hududiy sozlamalar'**
  String get regionalSettings;

  /// No description provided for @regionalSettingsDescription.
  ///
  /// In uz, this message translates to:
  /// **'Mahalliy kontent va vaqt zonalari uchun mamlakat, viloyat va shaharingizni boshqaring.'**
  String get regionalSettingsDescription;

  /// No description provided for @privacy.
  ///
  /// In uz, this message translates to:
  /// **'Maxfiylik'**
  String get privacy;

  /// No description provided for @changePassword.
  ///
  /// In uz, this message translates to:
  /// **'Parolni o‘zgartirish'**
  String get changePassword;

  /// No description provided for @changePasswordDescription.
  ///
  /// In uz, this message translates to:
  /// **'Profilingiz xavfsizligini ta\'minlash uchun hisob parolingizni yangilang.'**
  String get changePasswordDescription;

  /// No description provided for @appPreferences.
  ///
  /// In uz, this message translates to:
  /// **'Ilova sozlamalari'**
  String get appPreferences;

  /// No description provided for @themeSettings.
  ///
  /// In uz, this message translates to:
  /// **'Mavzu sozlamalari'**
  String get themeSettings;

  /// No description provided for @themeSettingsDescription.
  ///
  /// In uz, this message translates to:
  /// **'Yorug‘ va qorong‘i rejimlar o‘rtasida almashing yoki tizim sozlamalari bilan sinxronlang.'**
  String get themeSettingsDescription;

  /// No description provided for @language.
  ///
  /// In uz, this message translates to:
  /// **'Til'**
  String get language;

  /// No description provided for @languageDescription.
  ///
  /// In uz, this message translates to:
  /// **'Qurilmangizning umumiy sozlamalaridan mustaqil ravishda ushbu ilova uchun tilni tanlang.'**
  String get languageDescription;

  /// No description provided for @referral.
  ///
  /// In uz, this message translates to:
  /// **'Tavsiya'**
  String get referral;

  /// No description provided for @referAndEarn.
  ///
  /// In uz, this message translates to:
  /// **'Taklif qiling va bonus oling'**
  String get referAndEarn;

  /// No description provided for @referDescription.
  ///
  /// In uz, this message translates to:
  /// **'Tarmog‘ingizni taklif qiling va keyingi xaridingiz uchun bonuslar to‘plang.'**
  String get referDescription;

  /// No description provided for @account.
  ///
  /// In uz, this message translates to:
  /// **'Hisob'**
  String get account;

  /// No description provided for @logout.
  ///
  /// In uz, this message translates to:
  /// **'Chiqish'**
  String get logout;

  /// No description provided for @editAndSettings.
  ///
  /// In uz, this message translates to:
  /// **'Tahrirlash va sozlamalar'**
  String get editAndSettings;

  /// No description provided for @logoutQuestion.
  ///
  /// In uz, this message translates to:
  /// **'Hisobdan chiqilsinmi?'**
  String get logoutQuestion;

  /// No description provided for @logoutDescription.
  ///
  /// In uz, this message translates to:
  /// **'Siz ushbu qurilmadan hisobingizdan chiqarilasiz. Istalgan vaqtda login ma\'lumotlaringiz orqali qayta kirishingiz mumkin.'**
  String get logoutDescription;

  /// No description provided for @stayLoggedIn.
  ///
  /// In uz, this message translates to:
  /// **'Hisobda qolish'**
  String get stayLoggedIn;

  /// No description provided for @logOut.
  ///
  /// In uz, this message translates to:
  /// **'Chiqish'**
  String get logOut;
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
