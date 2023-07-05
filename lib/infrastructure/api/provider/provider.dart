import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../callbacks/callbacks.dart';
import '../service/api_service.dart';
import '../service/prefrences.dart';

abstract class Providers implements CallBack {
  @override
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    return await ApiService().request(endPoint, method, map);
  }

  @override
  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    String token = Pref.readData(key: Pref.LOGIN_INFORMATION);
    print(token);

    print("Requested api token ------------>${token}");
    return await ApiService(token: token).request(endPoint, method, map);
  }
}
