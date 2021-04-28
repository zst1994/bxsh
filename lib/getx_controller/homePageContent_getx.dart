import 'package:flutter_bxsh/model/home_page_content_entity.dart';
import 'package:get/get.dart';

class HomePageContentController extends GetxController {
  RxList slides = [].obs;
  RxList category = [].obs;
  RxMap shopInfo = {}.obs;
  RxString advertesPicture = "".obs;

  Rx<HomePageContentEntity> data;

  setAll() {
    
  }

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
