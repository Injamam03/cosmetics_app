import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class ProductDetailController extends GetxController {
  final RxString selectedSize = '30ml'.obs;
  final RxBool isWishlisted = false.obs;
  final RxBool ingredientsExpanded = false.obs;
  final RxBool howToUseExpanded = false.obs;

  void selectSize(String size) => selectedSize.value = size;
  void toggleWishlist() => isWishlisted.toggle();
  void toggleIngredients() => ingredientsExpanded.toggle();
  void toggleHowToUse() => howToUseExpanded.toggle();
  void addToBag() => Get.toNamed(AppRoutes.cart);
}
