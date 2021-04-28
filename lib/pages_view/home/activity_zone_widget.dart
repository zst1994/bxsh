import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class ActivityZoneWidget extends StatelessWidget {
  const ActivityZoneWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(
      builder: (controller) {
        return controller.activityZone.length > 0
            ? Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10.w),
                color: Colors.white,
                child: GridView.builder(
                  //Container跟随GridView内容变化高度, shrinkWrap:true;
                  shrinkWrap: true,
                  // 取消滚动效果
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.activityZone.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Image.network(
                      controller.activityZone[i].pictureAddress,
                      fit: BoxFit.fill,
                    );
                  },
                  //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                      crossAxisCount: 3,
                      //纵轴间距
                      mainAxisSpacing: 0,
                      //横轴间距
                      crossAxisSpacing: 0,
                      //子组件宽高长度比例
                      childAspectRatio: 0.8),
                ))
            : Container();
      },
    );
  }
}
