import 'package:asiatic/infrastructure/api/repository/repository.dart';
import 'package:asiatic/infrastructure/api/service/prefrences.dart';
import 'package:asiatic/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateuserController extends GetxController {
  RxString domain = ''.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  requestDomain() async {
    await Repository().requestDomain(map: {"page": 1}).then((value) {
      print(value);
      domain.value = value[0]['domain'] ?? '';
      update();
    });
  }

  requestAccountCreation() async {
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
    } else if (domain.value.isEmpty) {
      Get.snackbar("Notice", "Empty domain",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 1));
    } else {
      await Repository().requestAccountCreate(map: {
        "address": "${email.text}@${domain.value}",
        "password": "${email.text}"
      }).then((value) {
        print(value);
        if (value['id'] != null) {
          Pref.writeData(key: Pref.CREATION_ID, value: value['id']);
          Get.offNamed(Routes.LOGINUSER);
          Get.snackbar("Notice", "Account created,Please sign in",
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: Duration(seconds: 1));
        } else {
          Get.snackbar("Notice", "${value['title']}",
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
    requestDomain();
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
