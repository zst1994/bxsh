import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(
      builder: (controller) {
        return controller.category.length > 0
            ? Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.w)),
                child: GridView.count(
                  // Container跟随GridView内容变化高度, shrinkWrap:true;
                  shrinkWrap: true,
                  // 取消滚动效果
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 8 / 7,
                  children: List.generate(4, (i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 90.w,
                            child: Image.network(
                              controller.category[i].image,
                              fit: BoxFit.fitWidth,
                            )),
                        SizedBox(
                          height: 15.w,
                        ),
                        Text(
                          controller.category[i].mallCategoryName,
                          style: myTextStyle(26, 0xff333333, false),
                        )
                      ],
                    );
                  }),
                ),
              )
            : Container();
      },
    );
  }
}
