import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class FloorWidget extends StatelessWidget {
  const FloorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(builder: (controller) {
      return Column(
        children: List.generate(controller.floor.length, (i) {
          return Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: Image.network(
                    controller.floor[i]['floor'].pictureAddress,
                    fit: BoxFit.fitWidth,
                  )),
              Row(
                children: [
                  Column(
                    children: [
                      Image.network(
                        controller.floor[i]['data'][0].image,
                        fit: BoxFit.fitWidth,
                        width: 375.w,
                      ),
                      Image.network(
                        controller.floor[i]['data'][3].image,
                        fit: BoxFit.fitWidth,
                        width: 375.w,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.network(
                        controller.floor[i]['data'][1].image,
                        fit: BoxFit.fitWidth,
                        width: 375.w,
                      ),
                      Image.network(
                        controller.floor[i]['data'][2].image,
                        fit: BoxFit.fitWidth,
                        width: 375.w,
                      ),
                      Image.network(
                        controller.floor[i]['data'][4].image,
                        fit: BoxFit.fitWidth,
                        width: 375.w,
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        }),
      );
    });
  }
}
