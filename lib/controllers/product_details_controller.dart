import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isExpanded = false.obs;
  RxInt currentSizeIndex = 0.obs;
  RxInt currentColorIndex = 0.obs;
  RxInt counter = 0.obs;

  /* @override
  void onInit() {
   
    super.onInit();
  } */
  void increase() {
    counter.value++;
  }

  void decrease() {
    counter.value--;
  }

  void expand() {
    isExpanded.value = !isExpanded.value;
  }
}
