import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/pages_view/coupons/coupons_btn.dart';
import 'package:flutter_bxsh/pages_view/coupons/coupons_img.dart';
import 'package:flutter_bxsh/pages_view/coupons/coupons_lists.dart';
import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:flutter_bxsh/getx_controller/coupons_getx.dart';

class CouponsWidget extends StatelessWidget {
  CouponsWidget({Key key}) : super(key: key);

  final CouponsController couponsGetx = Get.put(CouponsController());

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiffAppBarHeight(appBarTitle: '领取优惠券', leadingTapResult: {}),
      body: FutureBuilder(
          future: couponsGetx.getCouponsPic(_refreshController),
          builder: (context, snapshot) {
            return ProgressDialog(
                loading: !snapshot.hasData,
                child: couponsGetx.picAddress.value != ""
                    ? SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: true,
                        header: WaterDropHeader(
                          waterDropColor: Theme.of(context).accentColor,
                          complete: Text(
                            '加载完成',
                            style: myTextStyle(
                                26, Theme.of(context).accentColor.value, false),
                          ),
                        ),
                        footer: CustomFooter(
                          builder: (BuildContext context, LoadStatus mode) {
                            String textContent = '';
                            Widget contentWidget;
                            if (mode == LoadStatus.idle) {
                              textContent = "加载完成";
                            } else if (mode == LoadStatus.loading) {
                              contentWidget = CircularProgressIndicator(
                                color: Theme.of(context).accentColor,
                              );
                            } else if (mode == LoadStatus.failed) {
                              textContent = "加载失败，请重新刷新加载!";
                            } else if (mode == LoadStatus.canLoading) {
                              textContent = "加载中...";
                            } else {
                              textContent = "---到底了---";
                            }
                            return Container(
                              height: 55.0,
                              child: Center(
                                  child: textContent != ''
                                      ? Text(textContent,
                                          style: myTextStyle(
                                              26, 0xff666666, false))
                                      : contentWidget),
                            );
                          },
                        ),
                        onRefresh: () =>
                            couponsGetx.onRefresh(_refreshController),
                        onLoading: () =>
                            couponsGetx.onLoading(_refreshController),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 10.w),
                          children: [
                            CouponsImg(),
                            CouponsBtn(),
                            CouponsLists()
                          ],
                        ))
                    : Container());
          }),
    );
  }
}
