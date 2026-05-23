import 'package:get/get.dart';
import '../../../../../constant/constring.dart';
import '../../../../../routes/app_routes.dart';

class DeleteAccountController extends GetxController {
  final RxString selectedReason = ''.obs;
  final RxBool isLoading = false.obs;

  final List<String> reasons = [
    Constring.deleteAccountReason1,
    Constring.deleteAccountReason2,
    Constring.deleteAccountReason3,
    Constring.deleteAccountReason4,
  ];

  void selectReason(String reason) => selectedReason.value = reason;

  Future<void> deleteAccount() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.signIn);
  }

  void goBack() => Get.back();
}
