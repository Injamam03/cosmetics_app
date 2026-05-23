import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';


class ChooseRoleController extends GetxController {
  final RxString selectedRole = ''.obs;

  void selectRole(String role) => selectedRole.value = role;

  void onContinue() {
    if (selectedRole.value == 'customer') {
      Get.offAllNamed(AppRoutes.signIn);
    } else if (selectedRole.value == 'seller') {
      Get.offAllNamed(AppRoutes.signIn);
    }
  }
}
