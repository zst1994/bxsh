import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';
import 'package:get/get.dart';

class ShopGoodsImgWidget extends StatelessWidget {
  ShopGoodsImgWidget({Key key}) : super(key: key);

  final GoodDetailController goodDetailGetx = Get.put(GoodDetailController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.network(
        goodDetailGetx.goodDetailData['goodInfo']['image1'],
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }
}
