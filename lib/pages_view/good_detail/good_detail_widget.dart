import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/components/img_asset.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:flutter_bxsh/pages_view/good_detail/good_tabView_widget.dart';
import 'package:flutter_bxsh/pages_view/good_detail/good_tip_widget.dart';
import 'package:flutter_bxsh/pages_view/good_detail/shopGoodsInfo_widget.dart';
import 'package:flutter_bxsh/common/isEmpty.dart';
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

  Map parameters = Get.arguments;
  final GoodDetailController goodDetailGetx = Get.put(GoodDetailController());

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
    return Scaffold(
      appBar: DiffAppBarHeight(
          customTitleBool: true,
          customTitleWidget: Obx(() => Text(
                Empty.isEmpty(goodDetailGetx.goodDetailData)
                    ? ''
                    : goodDetailGetx.goodDetailData['goodInfo']['goodsName'],
                style: myTextStyle(34, 0xffffffff, true),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
          leadingTapResult: {}),
      body: FutureBuilder(
          future: goodDetailGetx.getGoodDetail(parameters['goodsId']),
          builder: (context, snapshot) {
            final double sizeWidth = MediaQuery.of(context).size.width;

            return ProgressDialog(
                loading: !snapshot.hasData,
                child: Empty.isEmpty(goodDetailGetx.goodDetailData)
                    ? Container()
                    : Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.only(bottom: 120.w),
                            child: ListView(
                              shrinkWrap: true,
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
                          _addShopCarBtn(sizeWidth)
                        ],
                      ));
          }),
    );
  }

  Widget _addShopCarBtn(double sizeWidth) {
    // Postioned限制left:0,right:0,这样就充满父Widget 而且不会报错
    return Positioned(
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
                color: Colors.white,
                child: Center(
                    child: ImgAsset(
                  imgUrl: 'assets/images/shop_cart.webp',
                  imgW: 60,
                  fit: BoxFit.fitWidth,
                )),
              ),
              Container(
                width: sizeWidth * 0.4,
                height: 120.w,
                color: Colors.green,
                child: Center(
                  child: Text(
                    '加入购物车',
                    style: myTextStyle(30, 0xffffffff, false),
                  ),
                ),
              ),
              Container(
                width: sizeWidth * 0.4,
                height: 120.w,
                color: Colors.red,
                child: Center(
                  child: Text(
                    '立即购买',
                    style: myTextStyle(30, 0xffffffff, false),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
