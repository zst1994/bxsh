import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:flutter_bxsh/pages_view/home/activity_zone_widget.dart';
import 'package:flutter_bxsh/pages_view/home/advertesPicture_widget.dart';
import 'package:flutter_bxsh/pages_view/home/floor_widget.dart';
import 'package:flutter_bxsh/pages_view/home/home_category_widget.dart';
import 'package:flutter_bxsh/pages_view/home/hot_widget.dart';
import 'package:flutter_bxsh/pages_view/home/recommend_widget.dart';
import 'package:flutter_bxsh/common/loading_view.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';
import 'package:flutter_bxsh/pages_view/home/search_widget.dart';
import 'package:flutter_bxsh/pages_view/home/swiper_widget.dart';

class Home extends StatelessWidget {
  final HomePageContentController homeController =
      Get.put(HomePageContentController());

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: homeController.getHomePageContent(),
        builder: (context, snapshot) {
          return ProgressDialog(
            loading: !snapshot.hasData,
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(
                waterDropColor: Theme.of(context).accentColor,
                complete: Text(
                  '加载完成',
                  style: myTextStyle(
                      26, Theme.of(context).accentColor.value, false),
                ),
              ),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  String textContent = '';
                  Widget contentWidget;
                  if (mode == LoadStatus.idle) {
                    textContent = "加载完成";
                  } else if (mode == LoadStatus.loading) {
                    contentWidget = CircularProgressIndicator();
                  } else if (mode == LoadStatus.failed) {
                    textContent = "加载失败，请重新刷新加载!";
                  } else if (mode == LoadStatus.canLoading) {
                    textContent = "加载中...";
                  } else {
                    textContent = "暂无更多数据!";
                  }
                  return Container(
                    height: 55.0,
                    child: Center(
                        child: textContent != ''
                            ? Text(textContent,
                                style: myTextStyle(26,
                                    Theme.of(context).accentColor.value, false))
                            : contentWidget),
                  );
                },
              ),
              onRefresh: () => homeController.onRefresh(_refreshController),
              onLoading: () => homeController.onLoading(_refreshController),
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
                  HotWidget()
                ],
              ),
            ),
          );
        });
  }
}
