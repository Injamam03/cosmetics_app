import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class DashboardController extends GetxController {
  final RxInt currentNavIndex = 0.obs;

  void onNavTap(int index) {
    currentNavIndex.value = index;
    switch (index) {
      case 0: Get.offAllNamed(AppRoutes.sellerHome); break;
      case 1: Get.offAllNamed(AppRoutes.sellerInventory); break;
      case 2: Get.offAllNamed(AppRoutes.sellerOrders); break;
      case 3: Get.offAllNamed(AppRoutes.sellerInsights); break;
    }
  }
}
