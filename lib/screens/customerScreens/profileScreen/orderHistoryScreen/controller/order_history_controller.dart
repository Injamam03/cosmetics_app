import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  final RxString selectedFilter = 'This Month'.obs;
  final List<String> filters = ['Today', 'This Week', 'This Month'];
  void setFilter(String f) => selectedFilter.value = f;
}
