import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class OrderSuccessController extends GetxController {
  final String orderId = '#LUM-882901-X';
  void trackOrder() {}
  void continueShopping() => Get.offAllNamed(AppRoutes.customerHome);
}
