import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class CheckoutController extends GetxController {
  final RxInt currentStep = 0.obs;
  final RxString selectedDelivery = 'standard'.obs;
  final RxBool isLoading = false.obs;

  void nextStep() {
    if (currentStep.value < 2) currentStep.value++;
  }

  void prevStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  void selectDelivery(String type) => selectedDelivery.value = type;

  Future<void> placeOrder() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.orderSuccess);
  }
}
