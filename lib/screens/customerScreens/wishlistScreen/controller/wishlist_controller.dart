import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class WishlistController extends GetxController {
  final RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {'name': 'Radiance Renewal Serum', 'tag': '30ml • Infused with Gold Leaf & Peptides', 'category': 'Anti-Aging', 'price': '\$128.00', 'oldPrice': '\$145.00'},
    {'name': 'Midnight Velvet Palette', 'tag': '8 Shades • Matte & Shimmer Finish', 'category': 'Makeup Artistry', 'price': '\$85.00', 'oldPrice': null},
    {'name': 'Silk Bloom Hair Mist', 'tag': '100ml • Nourishing Formula', 'category': 'Fragrance', 'price': '\$62.00', 'oldPrice': null},
  ].obs;

  void removeItem(int index) => items.removeAt(index);
  void moveToCart(int index) => Get.toNamed(AppRoutes.cart);
}
