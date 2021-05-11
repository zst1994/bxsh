import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';

class ShopGoodsInfoWidget extends StatelessWidget {
  const ShopGoodsInfoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoodDetailController goodDetailController =
        Get.put(GoodDetailController());

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Text(
              goodDetailController.goodDetailData['goodInfo']['goodsName'],
              style: myTextStyle(30, 0xff333333, false),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
            margin: EdgeInsets.symmetric(vertical: 20.w),
            decoration: BoxDecoration(
                color: Color(0xffF0FFF0),
                borderRadius: BorderRadius.circular(5.w),
                border: Border.all(color: Color(0xff32CD32))),
            child: Text(
              '支持配送到家',
              style: myTextStyle(24, 0xff32CD32, false),
            ),
          ),
          Text(
            '编号：${goodDetailController.goodDetailData['goodInfo']['goodsSerialNumber']}',
            style: myTextStyle(26, 0xff999999, false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.w, bottom: 20.w),
            child: Text.rich(TextSpan(
                text:
                    '￥${goodDetailController.goodDetailData['goodInfo']['presentPrice'].toString()} ',
                style: myTextStyle(30, 0xffFF0000, false),
                children: [
                  TextSpan(
                      text: '           市场价:   ',
                      style: myTextStyle(30, 0xff666666, false),
                      children: [
                        TextSpan(
                            text:
                                '￥${goodDetailController.goodDetailData['goodInfo']['oriPrice'].toString()}',
                            style: myTextStyle(30, 0xff999999, false,
                                decoration: TextDecoration.lineThrough))
                      ])
                ])),
          )
        ],
      ),
    );
  }
}
