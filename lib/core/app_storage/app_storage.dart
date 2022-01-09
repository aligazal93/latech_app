import 'package:get_storage/get_storage.dart';
import 'package:latech_app/core/models/user.dart';

class AppStorage {

  static late GetStorage _box;

  static Future init() async {
    await GetStorage.init();
    _box = GetStorage();
  }

  static Future<void> cacheUser(User user) async {
    await _box.write('user', user.toJson());
  }

  // static Future<void> cacheToken(String token) async {
  //   await _box.write('token', token);
  // }
  //
  // static Future<void> cacheEmailAddress(String email) async {
  //   await _box.write('email', email);
  // }

  static bool get isLogged => _box.hasData('user');

  static User get userInfo => User.fromJson(_box.read('user'));

  // static String get getToken => isLogged ? _box.read('token') : '';
  //
  // static String get getEmail => _box.read('email');


}