import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keyMarketname = 'Market';
  static const _keybool = 'bool';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setMarketName(String name) async {
    _preferences = await SharedPreferences.getInstance();
    return await _preferences?.setString(_keyMarketname, name);
  }

  static Future<String?> getMarketName() async {
    _preferences = await SharedPreferences.getInstance();

    return _preferences?.getString(_keyMarketname);
  }

  static Future setisLogin(bool islogin) async {
    _preferences = await SharedPreferences.getInstance();

    return await _preferences?.setBool(_keybool, islogin);
  }

  static Future<bool?> getislogin() async {
    _preferences = await SharedPreferences.getInstance();

    return _preferences?.getBool(_keybool);
  }
}
