import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt bilangan = 0.obs;

  void tambahsatu() {
    if (bilangan.value >= 20) {
      Get.snackbar('Warning', 'loba teuing plok');
    } else {
      bilangan.value++;
    }
  }
  void kurangsatu() {
    if (bilangan.value >= 0) {
      Get.snackbar('Warning', 'loba teuing plok');
    } else {
      bilangan.value--;
    }
  }
}