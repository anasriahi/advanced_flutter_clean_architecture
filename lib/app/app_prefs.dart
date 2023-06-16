
import 'package:advanced_flutter_clean_architecture/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PRESS_KEY_LANG = "PRESS_KEY_LANG";

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
}