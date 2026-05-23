import 'package:get/get.dart';

class InventoryController extends GetxController {
  final RxString selectedCat = 'All Products'.obs;
  final List<String> cats = ['All Products', 'Skincare', 'Cosmetics', 'Fragrance'];
  void setCat(String c) => selectedCat.value = c;
}
