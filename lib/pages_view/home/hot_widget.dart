import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class HotWidget extends StatelessWidget {
  const HotWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageContentController controller =
        Get.put(HomePageContentController());
    return Obx(() {
      return controller.homePageBelowConten.length > 0
          ? Column(
              children: [_hotTitle(context), _hotBody(context, controller)],
            )
          : Container();
    });
  }

  Widget _hotBody(BuildContext context, HomePageContentController controller) {
    return Wrap(
        children: List.generate(controller.homePageBelowConten.length, (index) {
      return InkWell(
        onTap: () {
          Get.toNamed("/goodDetail", arguments: {
            'goodsId': controller.homePageBelowConten[index]['goodsId']
          });
        },
        child: Container(
          width: 375.w,
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                controller.homePageBelowConten[index]['image'],
                fit: BoxFit.fitWidth,
                width: 300.w,
              ),
              SizedBox(
                height: 20.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "${controller.homePageBelowConten[index]['name']}",
                  // 文字超出最大宽度显示省略号
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: myTextStyle(
                      28, Theme.of(context).accentColor.value, false),
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "￥${controller.homePageBelowConten[index]['mallPrice']}",
                    style: myTextStyle(28, 0xff333333, false),
                  ),
                  Text(
                    "￥${controller.homePageBelowConten[index]['price']}",
                    style: myTextStyle(28, 0xff999999, false,
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }));
  }

  Widget _hotTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              shape: BoxShape.circle, //可以设置角度，BoxShape.circle直接圆形
            ),
            child: Center(
                child: Text(
              '火',
              style: myTextStyle(26, 0xffffffff, false),
            )),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            '火爆专区',
            style: myTextStyle(28, 0xff333333, false),
          )
        ],
      ),
    );
  }
}
