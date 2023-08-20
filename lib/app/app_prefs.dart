
import 'package:advanced_flutter_clean_architecture/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PRESS_KEY_LANG = "PRESS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED = "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPrefernces;

  AppPreferences(this._sharedPrefernces);

  Future<String> getAppLanguage() async {
    String? language = _sharedPrefernces.getString(PRESS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  // on boarding
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPrefernces.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPrefernces.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ?? false;
  }

  // login
  Future<void> setUserLoggedIn() async {
    _sharedPrefernces.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPrefernces.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }
}