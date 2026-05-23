import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  void goToEditProfile() => Get.toNamed(AppRoutes.editProfile);
  void goToChangePassword() => Get.toNamed(AppRoutes.changePassword);
  void goToContactSupport() => Get.toNamed(AppRoutes.contactSupport);
  void goToDeleteAccount() => Get.toNamed(AppRoutes.deleteAccount);
  void goToOrderHistory() => Get.toNamed(AppRoutes.orderHistory);
  void goToWishlist() => Get.toNamed(AppRoutes.wishlist);
  void onLogout() => Get.offAllNamed(AppRoutes.signIn);
}
