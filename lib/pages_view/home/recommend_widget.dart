import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_recommendTitle(context), _recommendBody()],
    );
  }

  Widget _recommendTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).dividerColor, width: 1.w))),
      child: Text(
        '商品推荐',
        style: myTextStyle(28, Theme.of(context).accentColor.value, false),
      ),
    );
  }

  Widget _recommendBody() {
    return GetBuilder<HomePageContentController>(builder: (controller) {
      return Container(
        height: 340.w,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.recommend.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed("/goodDetail", arguments: {
                    'goodsId': controller.recommend[index].goodsId
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          right: BorderSide(
                              color: Color(0xffececec), width: 1.w))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.w),
                        child: Image.network(
                          controller.recommend[index].image,
                          fit: BoxFit.fitWidth,
                          width: 240.w,
                        ),
                      ),
                      Text(
                        '￥' + controller.recommend[index].mallPrice.toString(),
                        style: myTextStyle(26, 0xff333333, false),
                      ),
                      Text(
                        '￥' + controller.recommend[index].price.toString(),
                        style: TextStyle(
                            fontSize: 26.sp,
                            color: Color(0xff999999),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
