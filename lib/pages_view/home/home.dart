import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bxsh/model/home_page_below_conten_entity.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatelessWidget {
  final HomePageContentController homeController =
      Get.put(HomePageContentController());

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getHomePageContent(),
        builder: (context, snapshot) {
          return ProgressDialog(
            loading: !snapshot.hasData,
            child: Center(child: GetBuilder<HomePageContentController>(
              builder: (controller) {
                return SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: WaterDropHeader(),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text("pull up load");
                      } else if (mode == LoadStatus.loading) {
                        body = CircularProgressIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text("Load Failed!Click retry!");
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text("release to load more");
                      } else {
                        body = Text("No more Data");
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    },
                  ),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SearchWidget(),
                      SwiperWidget(),
                      HomeCategoryWidget(),
                      AdvertesPictureWidget(),
                      ActivityZoneWidget(),
                      RecommendWidget(),
                      FloorWidget(),
                      // HotWidget()
                    ],
                  ),
                );
              },
            )),
          );
        });
  }

  // 下拉刷新
  void _onRefresh() async {
    homeController.addPage(pageNum: 0);
    _getHomePageContent();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    homeController.addPage();
    _getHomePageBelowConten();
    _refreshController.loadComplete();
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

  Future _getHomePageBelowConten() async {
    await DioManager.getInstance().post("/baixing/wxmini/homePageBelowConten",
        {'page': homeController.page.value}, onSuccess: (data) {
      print(data);
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
}
