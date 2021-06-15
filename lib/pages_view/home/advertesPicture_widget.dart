import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/common/call_phone.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';

class AdvertesPictureWidget extends StatelessWidget {
  const AdvertesPictureWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(builder: (_getC) {
      return _getC.advertesPicture.value != ""
          ? Container(
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed('/coupons'),
                    child: Image.network(
                      _getC.advertesPicture.value,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  InkWell(
                    onTap: () => Call.makePhoneCall(
                        'tel:${_getC.shopInfo['leaderPhone'] ?? ''}'),
                    child: Image.network(
                      _getC.shopInfo['leaderImage'] ?? '',
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ))
          : Container();
    });
  }
}
