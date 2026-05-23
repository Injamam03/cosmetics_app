import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class ProductsController extends GetxController {
  final RxString selectedFilter = 'All Stock'.obs;
  final List<String> filters = ['All Stock', 'Low Stock', 'Inactive'];
  void setFilter(String f) => selectedFilter.value = f;
  void goToAddProduct() => Get.toNamed(AppRoutes.addProduct);
}
