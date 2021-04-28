import 'package:flutter/material.dart';
import 'package:flutter_bxsh/pages_view/home/activity_zone_widget.dart';
import 'package:flutter_bxsh/pages_view/home/advertesPicture_widget.dart';
import 'package:flutter_bxsh/pages_view/home/floor_widget.dart';
import 'package:flutter_bxsh/pages_view/home/home_category_widget.dart';
import 'package:flutter_bxsh/pages_view/home/recommend_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_bxsh/common/loading_view.dart';
import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:flutter_bxsh/model/home_page_content_entity.dart';
import 'package:flutter_bxsh/pages_view/home/search_widget.dart';
import 'package:flutter_bxsh/pages_view/home/swiper_widget.dart';

class Home extends StatelessWidget {
  final HomePageContentController homeController =
      Get.put(HomePageContentController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getHomePageContent(),
        builder: (context, snapshot) {
          return ProgressDialog(
            loading: !snapshot.hasData,
            child: Center(child: GetBuilder<HomePageContentController>(
              builder: (controller) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    SearchWidget(),
                    SwiperWidget(),
                    HomeCategoryWidget(),
                    AdvertesPictureWidget(),
                    ActivityZoneWidget(),
                    RecommendWidget(),
                    FloorWidget(),
                  ],
                );
              },
            )),
          );
        });
  }

  Future _getHomePageContent() async {
    await DioManager.getInstance().post<HomePageContentEntity>(
        "/baixing/wxmini/homePageContent", {}, onSuccess: (data) {
      homeController.setSlides(data.slides);
      homeController.setCategory(data.category);
      homeController.setAdvertesPicture(data.advertesPicture.pictureAddress);
      homeController.setShopInfo({
        'leaderImage': data.shopInfo.leaderImage,
        'leaderPhone': data.shopInfo.leaderPhone,
        'shopName': data.shopInfo.shopName
      });

      List activityZone = [];
      activityZone
        ..add(data.saoma)
        ..add(data.integralMallPic)
        ..add(data.newUser);
      homeController.setActivityZone(activityZone);
      homeController.setRecommend(data.recommend);

      List floor = [];
      floor
        ..add({'floor': data.floor1Pic, 'data': data.floor1})
        ..add({'floor': data.floor2Pic, 'data': data.floor2})
        ..add({'floor': data.floor3Pic, 'data': data.floor3});
      homeController.setFloor(floor);
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
}
