import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:flutter_bxsh/getx_controller/coupons_getx.dart';

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
                child: couponsGetx.picAddress.value != ""
                    ? Column(
                        children: [_couponsImg(), _couponsBtn(context)],
                      )
                    : Container());
          }),
    );
  }

  Widget _couponsImg() {
    return Image.network(
      couponsGetx.picAddress.value,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _couponsBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.w),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              color: Color(0xffFFC0CB),
            ),
            child: Text(
              '使用优惠券',
              style: myTextStyle(26, 0XFFFFFFFF, false),
            ),
          ),
        ),
      ],
    );
  }
}
