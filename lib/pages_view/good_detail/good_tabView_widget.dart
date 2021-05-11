import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoodTabViewWidget extends StatelessWidget {
  TabController _tabController;
  List _spList;

  GoodTabViewWidget(this._tabController, this._spList, {Key key})
      : super(key: key);

  final GoodDetailController goodDetailController =
      Get.put(GoodDetailController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            indicatorWeight: 2.w,
            indicatorColor: Theme.of(context).accentColor,
            indicatorPadding: EdgeInsets.only(bottom: 5.w),
            labelColor: Theme.of(context).accentColor,
            labelStyle: TextStyle(fontSize: 28.sp),
            unselectedLabelColor: Color(0xff333333),
            unselectedLabelStyle: TextStyle(fontSize: 28.sp),
            tabs: _spList.map((f) {
              return Container(
                width: double.infinity / 2,
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Center(
                  child: Text(f),
                ),
              );
            }).toList(),
          ),
        ),
        ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: _tabController, children: [
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Html(
                        data: goodDetailController.goodDetailData['goodInfo']
                            ['goodsDetail']),
                  ),
                  Text('data')
                ]),
              )
            ]),
      ],
    );
  }
}
