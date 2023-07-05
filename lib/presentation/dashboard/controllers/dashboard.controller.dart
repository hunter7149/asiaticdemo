import 'package:asiatic/infrastructure/api/repository/repository.dart';
import 'package:get/get.dart';

import '../../../infrastructure/api/service/prefrences.dart';
import '../../../infrastructure/navigation/routes.dart';

class DashboardController extends GetxController {
  RxBool loading = false.obs;

  RxList<dynamic> mailList = <dynamic>[].obs;
  requestMessage() async {
    loading.value = true;
    update();
    await Repository().requestMessageList(map: {"page": 1}).then((value) {
      mailList.clear();
      mailList.value = value ?? [];
      mailList.refresh();
    });
    loading.value = false;
    update();
  }

  requestSingOut() {
    Pref.removeData(key: Pref.LOGIN_INFORMATION);

    Pref.removeData(key: Pref.CREATION_ID);
    Get.offNamed(Routes.HOME);
  }

  @override
  void onInit() async {
    super.onInit();
    await requestMessage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
