import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

// 轮播图
class SwiperWidget extends StatelessWidget {
  const SwiperWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(builder: (_getC) {
      return _getC.slides.length > 0
          ? Container(
              width: double.infinity,
              height: 350.w,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.toNamed("/goodDetail",
                        arguments: {'goodsId': _getC.slides[index].goodsId}),
                    child: Image.network(
                      _getC.slides[index].image,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                duration: 1000,
                autoplay: true,
                scrollDirection: Axis.horizontal,
                itemCount: _getC.slides.length,
                // 展示默认分页指示器
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white,
                )),
                // 展示默认分页按钮
                // control: SwiperControl(),
              ),
            )
          : Container();
    });
  }
}
