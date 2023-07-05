import 'package:get/get.dart';

import '../../../../presentation/createuser/controllers/createuser.controller.dart';

class CreateuserControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateuserController>(
      () => CreateuserController(),
    );
  }
}
