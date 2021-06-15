import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/isEmpty.dart';
import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:flutter_bxsh/getx_controller/coupons.dart';

class CouponsWidget extends StatelessWidget {
  CouponsWidget({Key key}) : super(key: key);

  final CouponsController couponsGetx = Get.put(CouponsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiffAppBarHeight(appBarTitle: '领取优惠券', leadingTapResult: {}),
      body: FutureBuilder(
          future: couponsGetx.getCouponsPic(),
          builder: (context, snapshot) {
            return ProgressDialog(
                loading: !snapshot.hasData,
                child: Empty.isEmpty("")
                    ? Container()
                    : Column(
                        children: [
                          Image.network(
                            '',
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          )
                        ],
                      ));
          }),
    );
  }
}
