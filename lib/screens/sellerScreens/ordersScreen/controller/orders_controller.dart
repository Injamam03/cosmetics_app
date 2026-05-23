import '../../../../constant/constring.dart';
import 'package:get/get.dart';

class SellerOrdersController extends GetxController {
  final RxString selectedFilter = 'This Month'.obs;
  final List<String> filters = [
    Constring.orderHistoryToday,
    Constring.orderHistoryThisWeek,
    Constring.orderHistoryThisMonth,
  ];
  void setFilter(String f) => selectedFilter.value = f;
}
