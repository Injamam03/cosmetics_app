import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class CartController extends GetxController {
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[
    {'name': 'Velvet Glow Serum', 'variant': '30ml / Anti-Aging', 'price': 85.0, 'qty': 1},
    {'name': 'Luminous Lips', 'variant': 'Shade: Royal Crimson', 'price': 68.0, 'qty': 1},
    {'name': 'Pearl Essence Cleanser', 'variant': '150ml / Sensitive Skin', 'price': 54.0, 'qty': 1},
  ].obs;

  double get subtotal => cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['qty']));
  double get total => subtotal;

  void increment(int index) {
    cartItems[index] = {...cartItems[index], 'qty': cartItems[index]['qty'] + 1};
  }

  void decrement(int index) {
    if (cartItems[index]['qty'] > 1) {
      cartItems[index] = {...cartItems[index], 'qty': cartItems[index]['qty'] - 1};
    }
  }

  void removeItem(int index) => cartItems.removeAt(index);

  void goToCheckout() => Get.toNamed(AppRoutes.checkout);
}
