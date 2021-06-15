import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class FloorWidget extends StatelessWidget {
  const FloorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(builder: (_getC) {
      return Column(
        children: List.generate(_getC.floor.length, (i) {
          return Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: Image.network(
                    _getC.floor[i]['floor'].pictureAddress,
                    fit: BoxFit.fitWidth,
                  )),
              Row(
                children: [
                  Column(
                    children: [
                      _floor(_getC.floor[i]['data'][0].image,
                          _getC.floor[i]['data'][0].goodsId),
                      _floor(_getC.floor[i]['data'][3].image,
                          _getC.floor[i]['data'][3].goodsId),
                    ],
                  ),
                  Column(
                    children: [
                      _floor(_getC.floor[i]['data'][1].image,
                          _getC.floor[i]['data'][1].goodsId),
                      _floor(_getC.floor[i]['data'][2].image,
                          _getC.floor[i]['data'][2].goodsId),
                      _floor(_getC.floor[i]['data'][4].image,
                          _getC.floor[i]['data'][4].goodsId),
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

  Widget _floor(String imgUrl, String goodsId) {
    return InkWell(
      onTap: () => Get.toNamed("/goodDetail", arguments: {'goodsId': goodsId}),
      child: Image.network(
        imgUrl,
        fit: BoxFit.fitWidth,
        width: 375.w,
      ),
    );
  }
}
