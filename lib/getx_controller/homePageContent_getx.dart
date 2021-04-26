import 'package:get/get.dart';

class HomePageContentController extends GetxController {
  RxList slides = [].obs;
  RxList category = [].obs;
  RxMap shopInfo = {}.obs;
  RxString advertesPicture = "".obs;

  setSlides(List newSlides) {
    slides.assignAll(newSlides);
  }

  setCategory(List data) {
    category.assignAll(data);
  }

  setAdvertesPicture(String newAdvertesPicture) {
    advertesPicture.value = newAdvertesPicture;
  }

  setShopInfo(Map newShopInfo) {
    shopInfo.assignAll(newShopInfo);
  }
}
