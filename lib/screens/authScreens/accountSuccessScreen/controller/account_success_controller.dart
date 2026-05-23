import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class AccountSuccessController extends GetxController {
  void onStartShopping() => Get.offAllNamed(AppRoutes.customerHome);
}
