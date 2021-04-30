import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:flutter_bxsh/model/home_page_content_entity.dart';
import 'package:get/get.dart';

class HomePageContentController extends GetxController {
  RxList slides = [].obs;
  RxList category = [].obs;
  RxList activityZone = [].obs;
  RxList recommend = [].obs;
  RxList floor = [].obs;
  RxList homePageBelowConten = [].obs;

  RxMap shopInfo = {}.obs;

  RxInt page = 1.obs;

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

  setHomePageBelowConten(List data) {
    homePageBelowConten.assignAll(data);
  }

  // 下拉刷新
  void onRefresh(_refreshController) async {
    addPage(pageNum: 1);
    setHomePageBelowConten([]);
    getHomePageContent();
    // 顶部指示器刷新成功,是否要还原底部没有更多数据状态
    _refreshController.refreshCompleted();
    // 刷新底部指示器状态为idle
    _refreshController.resetNoData();
  }

  //上拉加载
  void onLoading(_refreshController) async {
    getHomePageBelowConten(_refreshController);
  }

  // 获取数据
  Future getHomePageContent() async {
    await DioManager.getInstance().post<HomePageContentEntity>(
        "/baixing/wxmini/homePageContent", {}, onSuccess: (data) {
      setSlides(data.slides);
      setCategory(data.category);
      setAdvertesPicture(data.advertesPicture.pictureAddress);
      setShopInfo({
        'leaderImage': data.shopInfo.leaderImage,
        'leaderPhone': data.shopInfo.leaderPhone,
        'shopName': data.shopInfo.shopName
      });

      List activityZone = [];
      activityZone
        ..add(data.saoma)
        ..add(data.integralMallPic)
        ..add(data.newUser);
      setActivityZone(activityZone);
      setRecommend(data.recommend);

      List floor = [];
      floor
        ..add({'floor': data.floor1Pic, 'data': data.floor1})
        ..add({'floor': data.floor2Pic, 'data': data.floor2})
        ..add({'floor': data.floor3Pic, 'data': data.floor3});
      setFloor(floor);
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }

  Future getHomePageBelowConten(_refreshController) async {
    await DioManager.getInstance()
        .post("/baixing/wxmini/homePageBelowConten", {'page': page.value},
            onSuccess: (data) {
      if (data != null) {
        List newListData = [];
        List oldList = homePageBelowConten;
        newListData..addAll(oldList)..addAll(data);
        setHomePageBelowConten(newListData);
        addPage();
        // 底部指示器加载完成
        _refreshController.loadComplete();
      } else {
        shortToast('暂无更多数据');
        // 底部指示器进入一个没有更多数据的状态
        _refreshController.loadNoData();
      }
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
