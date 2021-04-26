import 'package:flutter/material.dart';
import 'package:flutter_bxsh/pages_view/home/advertesPicture_widget.dart';
import 'package:flutter_bxsh/pages_view/home/home_category_widget.dart';
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
                print("=======${controller.advertesPicture}=======");
                return Column(
                  children: [
                    SearchWidget(),
                    SwiperWidget(),
                    HomeCategoryWidget(),
                    AdvertesPictureWidget(),
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
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
}
