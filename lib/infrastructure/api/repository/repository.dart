import '../provider/provider.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';
import '../service/prefrences.dart';

class Repository extends Providers {
  var deviceId = Pref.readData(key: Pref.DEVICE_ID);
  Future<dynamic> requestDomain({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.domainApi, method: Method.GET, map: map)
          .then((value) => value);
  Future<dynamic> requestAccountCreate(
          {required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.accountsApi, method: Method.POST, map: map)
          .then((value) => value);
  Future<dynamic> requestSignIn({required Map<String, dynamic> map}) async =>
      await commonApiCall(
              endPoint: AppUrl.tokenApi, method: Method.POST, map: map)
          .then((value) => value);
  Future<dynamic> requestMessageList(
          {required Map<String, dynamic> map}) async =>
      await tokenBaseApi(
              endPoint: AppUrl.messages, method: Method.GET, map: map)
          .then((value) => value);
}
