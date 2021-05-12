import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:flutter_bxsh/pages_view/good_detail/good_tabView_widget.dart';
import 'package:flutter_bxsh/pages_view/good_detail/good_tip_widget.dart';
import 'package:flutter_bxsh/pages_view/good_detail/shopGoodsInfo_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/common/isEmpty.dart';
import 'package:flutter_bxsh/common/loading_view.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';
import 'package:flutter_bxsh/pages_view/good_detail/shopGoodsImg_widget.dart';

class GoodDetailWidget extends StatefulWidget {
  GoodDetailWidget({Key key}) : super(key: key);

  @override
  _GoodDetailWidgetState createState() => _GoodDetailWidgetState();
}

class _GoodDetailWidgetState extends State<GoodDetailWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List _spList = ["详情", "评论"];
  bool scroBool = false;

  TabController _tabController;
  ScrollController _listViewController = new ScrollController();
  ScrollController _singleCrotroller = new ScrollController();

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = null;
    _tabController = TabController(
        initialIndex: 0, length: _spList.length, vsync: this); // 直接传this

    _listViewController.addListener(() {
      if (_listViewController.offset ==
          _listViewController.position.maxScrollExtent) {
        setState(() {
          scroBool = true;
        });
      } else if (_listViewController.offset == 0.0) {
        setState(() {
          scroBool = false;
        });
      }
    });

    _singleCrotroller.addListener(() {
      if (_singleCrotroller.offset == 0.0) {
        setState(() {
          scroBool = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map parameters = Get.arguments;
    final GoodDetailController goodDetailController =
        Get.put(GoodDetailController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Obx(() => Text(
              isEmpty(goodDetailController.goodDetailData)
                  ? ''
                  : goodDetailController.goodDetailData['goodInfo']
                      ['goodsName'],
              style: myTextStyle(34, 0xffffffff, true),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
      ),
      body: FutureBuilder(
          future: goodDetailController.getGoodDetail(parameters['goodsId']),
          builder: (context, snapshot) {
            final sizeWidth = MediaQuery.of(context).size.width;

            return ProgressDialog(
                loading: !snapshot.hasData,
                child: isEmpty(goodDetailController.goodDetailData)
                    ? Container()
                    : Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.only(bottom: 120.w),
                            child: ListView(
                              controller: _listViewController,
                              children: [
                                ShopGoodsImgWidget(),
                                ShopGoodsInfoWidget(),
                                GoodTipWidget(),
                                GoodTabViewWidget(_tabController,
                                    _singleCrotroller, scroBool, _spList),
                              ],
                            ),
                          ),
                          // Postioned限制left:0,right:0,这样就充满父Widget 而且不会报错
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: sizeWidth,
                                height: 120.w,
                                child: Row(
                                  children: [
                                    Container(
                                      width: sizeWidth * 0.2,
                                      height: 120.w,
                                      color: Colors.red,
                                    ),
                                    Container(
                                      width: sizeWidth * 0.4,
                                      height: 120.w,
                                      color: Colors.orange,
                                    ),
                                    Container(
                                      width: sizeWidth * 0.4,
                                      height: 120.w,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ));
          }),
    );
  }
}
