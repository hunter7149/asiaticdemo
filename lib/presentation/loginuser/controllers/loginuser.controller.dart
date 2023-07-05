import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/api/repository/repository.dart';
import '../../../infrastructure/api/service/prefrences.dart';
import '../../../infrastructure/navigation/routes.dart';

class LoginuserController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  requestSignIn() async {
    if (email.text.isEmpty) {
      Get.snackbar("Notice", "Empty email",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 1));
    } else if (password.text.isEmpty) {
      Get.snackbar("Notice", "Empty password",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 1));
    } else {
      await Repository().requestSignIn(map: {
        "address": "${email.text}",
        "password": "${password.text}"
      }).then((value) {
        print(value);
        if (value['token'] != null) {
          Pref.writeData(key: Pref.LOGIN_INFORMATION, value: value['token']);
          Pref.writeData(key: Pref.CREATION_ID, value: value['id']);
          Get.offNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar("Notice", "SERVER ERROR",
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(seconds: 1));
        }
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
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
