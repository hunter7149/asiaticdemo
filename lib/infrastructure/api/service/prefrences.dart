import 'package:get_storage/get_storage.dart';

class Pref {
  static final box = GetStorage('asiatic_app_data');

  static var DEVICE_ID = 'device-id';
  static var LOGIN_INFORMATION = 'login_information';
  static var CREATION_ID = 'creation_id';

  static void writeData({required String key, required dynamic value}) =>
      box.write(key, value);

  static dynamic readData({required String key}) => box.read(key);

  static void removeData({required String key}) => box.remove(key);
}
