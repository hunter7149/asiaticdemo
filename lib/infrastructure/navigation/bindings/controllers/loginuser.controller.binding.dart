import 'package:get/get.dart';

import '../../../../presentation/loginuser/controllers/loginuser.controller.dart';

class LoginuserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginuserController>(
      () => LoginuserController(),
    );
  }
}
