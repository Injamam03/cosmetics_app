import 'package:get/get.dart';
import 'package:stitch_app/routes/app_routes.dart';


class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) => currentPage.value = index;

  void goNext() => Get.offAllNamed(AppRoutes.chooseRole);

  void skip() => Get.offAllNamed(AppRoutes.chooseRole);
}
