import 'package:flutter_bxsh/model/home_page_content_entity.dart';
import 'package:get/get.dart';

class HomePageContentController extends GetxController {
  RxList slides = [].obs;
  RxList category = [].obs;
  RxList activityZone = [].obs;
  RxList recommend = [].obs;
  RxList floor = [].obs;
  var homePageBelowConten = [
    {'name': '1'},
    {'name': '2'},
  ].obs;

  RxMap shopInfo = {}.obs;

  RxInt page = 0.obs;

  RxString advertesPicture = "".obs;

  Rx<HomePageContentEntity> data;

  setAll() {}

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

  setActivityZone(List data) {
    activityZone.assignAll(data);
  }

  setRecommend(List data) {
    recommend.assignAll(data);
  }

  setFloor(List data) {
    floor.assignAll(data);
  }

  addPage({int pageNum}) {
    page.value = pageNum ?? this.page.value + 1;
  }

  setHomePageBelowConten(var data) {
    homePageBelowConten.assignAll(data);
    print('object==========${homePageBelowConten.length}');
  }
}
