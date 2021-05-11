import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';
import 'package:get/get.dart';

class ShopGoodsImgWidget extends StatelessWidget {
  const ShopGoodsImgWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoodDetailController goodDetailController =
        Get.put(GoodDetailController());

    return Container(
      width: double.infinity,
      child: Image.network(
        goodDetailController.goodDetailData['goodInfo']['image1'],
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }
}
