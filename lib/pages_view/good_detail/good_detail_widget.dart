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

  TabController _tabController;

  @protected
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = null;
    _tabController = TabController(
        initialIndex: 0, length: _spList.length, vsync: this); // 直接传this

    if (_tabController.indexIsChanging) {
      print("---->indexch");
    }
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
            return ProgressDialog(
              loading: !snapshot.hasData,
              child: isEmpty(goodDetailController.goodDetailData)
                  ? Container()
                  : ListView(
                      children: [
                        ShopGoodsImgWidget(),
                        ShopGoodsInfoWidget(),
                        GoodTipWidget(),
                        GoodTabViewWidget(_tabController, _spList)
                      ],
                    ),
            );
          }),
    );
  }
}
