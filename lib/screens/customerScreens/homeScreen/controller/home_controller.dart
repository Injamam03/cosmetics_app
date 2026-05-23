import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final RxInt currentNavIndex = 0.obs;

  void onNavTap(int index) => currentNavIndex.value = index;

  void goToCategories() => Get.toNamed(AppRoutes.categories);
  void goToProduct() => Get.toNamed(AppRoutes.productDetail);
  void goToCart() => Get.toNamed(AppRoutes.cart);
  void goToWishlist() => Get.toNamed(AppRoutes.wishlist);
  void goToProfile() => Get.toNamed(AppRoutes.customerProfile);
}
