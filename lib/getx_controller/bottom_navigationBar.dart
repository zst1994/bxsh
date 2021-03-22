import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt count = 0.obs;
  RxBool showload = false.obs;

  increment(int idx) {
    count.value = idx;
  }

  showLoad(bool show) {
    showload.value = show;
  }
}
