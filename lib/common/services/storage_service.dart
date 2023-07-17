import 'package:course_selling/common/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _pref.remove(key);
  }
}
