import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/components/img_asset.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/coupons_getx.dart';

class CouponsLists extends StatelessWidget {
  const CouponsLists({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponsController>(builder: (_getC) {
      debugPrint("aaaaa=============${_getC.couponsGetByself.length}");
      return _getC.couponsGetByself.length > 0
          ? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _getC.couponsGetByself.length,
              itemBuilder: (BuildContext context, int index) {
                Map data = _getC.couponsGetByself[index];
                return Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                    child: Row(
                      children: [
                        ImgAsset(
                          imgUrl: 'assets/images/coupons.webp',
                          imgW: 200.w,
                          imgH: 200.w,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "有效期：${data['voucher_start_date']}到${data['voucher_end_date']}",
                              style: myTextStyle(24, 0xff666666, false),
                            ),
                            Text(
                              data['voucher_desc'],
                              style: myTextStyle(40,
                                  Theme.of(context).accentColor.value, true),
                            ),
                            Text(
                              "满${data['voucher_pre_price']}可用 ${data['voucher_cat']} ${data['voucher_t_limit_stores']}",
                              style: myTextStyle(24, 0xff666666, false),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
          : Container();
    });
  }
}
