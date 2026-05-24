import 'dart:async';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class ForgotPasswordOtpController extends GetxController {
  final RxInt secondsRemaining = 60.obs;
  final RxBool canResend = false.obs;
  final RxBool isLoading = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    secondsRemaining.value = 60;
    canResend.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        canResend.value = true;
        t.cancel();
      }
    });
  }

  void resendOtp() {
    if (!canResend.value) return;
    _startTimer();
  }

  Future<void> onVerify() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.createNewPassword);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
