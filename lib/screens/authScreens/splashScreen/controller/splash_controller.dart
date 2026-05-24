import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stitch_app/constant/imageString.dart';
import 'package:stitch_app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await _precacheImages();
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.onboarding);
  }

  Future<void> _precacheImages() async {
    await precacheImage(
      const AssetImage(ImageString.onBoardingImag),
      Get.context!,
    );
  }
}