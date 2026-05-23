import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class AddProductController extends GetxController {
  final RxInt currentStep = 0.obs;
  final RxBool isLoading = false.obs;

  // Step 1
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final RxString selectedCategory = ''.obs;
  final formKey1 = GlobalKey<FormState>();

  // Step 2
  final RxList<String> images = <String>[].obs;

  // Step 3
  final priceController = TextEditingController();
  final skuController = TextEditingController();
  final costController = TextEditingController();
  final stockController = TextEditingController();
  final lowStockController = TextEditingController();
  final RxBool trackInventory = true.obs;
  final RxBool autoRestock = false.obs;
  final formKey3 = GlobalKey<FormState>();

  void selectCategory(String cat) => selectedCategory.value = cat;
  void toggleTrack() => trackInventory.toggle();
  void toggleRestock() => autoRestock.toggle();

  void nextStep() { if (currentStep.value < 3) currentStep.value++; }
  void prevStep() { if (currentStep.value > 0) currentStep.value--; else Get.back(); }

  Future<void> onPublish() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.sellerProducts);
    Get.snackbar('Published', 'Your product is now live!');
  }

  @override
  void onClose() {
    nameController.dispose(); descController.dispose();
    priceController.dispose(); skuController.dispose();
    costController.dispose(); stockController.dispose(); lowStockController.dispose();
    super.onClose();
  }
}
