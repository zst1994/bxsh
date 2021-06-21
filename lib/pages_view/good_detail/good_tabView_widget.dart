import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/common/formatDate.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/good_detail_getx.dart';

class GoodTabViewWidget extends StatelessWidget {
  TabController _tabController;
  ScrollController _singleCrotroller;
  bool scroBool;
  List _spList;

  GoodTabViewWidget(
      this._tabController, this._singleCrotroller, this.scroBool, this._spList,
      {Key key})
      : super(key: key);

  final GoodDetailController goodDetailGetx = Get.put(GoodDetailController());

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
            indicatorPadding: EdgeInsets.only(bottom: 8.w),
            labelColor: Theme.of(context).accentColor,
            labelStyle: TextStyle(fontSize: 28.sp),
            unselectedLabelColor: Color(0xff333333),
            unselectedLabelStyle: TextStyle(fontSize: 28.sp),
            tabs: _spList.map((f) {
              return Container(
                width: double.infinity / 2,
                padding: EdgeInsets.only(top: 24.w, bottom: 32.w),
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
                height: MediaQuery.of(context).size.height / 1.4,
                child: TabBarView(controller: _tabController, children: [
                  SingleChildScrollView(
                    controller: _singleCrotroller,
                    physics: scroBool ? null : NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Html(
                          data: goodDetailGetx.goodDetailData['goodInfo']
                              ['goodsDetail'],
                        ),
                        _bottomImg(
                            goodDetailGetx.goodDetailData['advertesPicture']
                                ['PICTURE_ADDRESS'])
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    controller: _singleCrotroller,
                    physics: scroBool ? null : NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        goodDetailGetx.goodDetailData['goodComments'].length > 0
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 5.w),
                                itemBuilder: (context, index) => Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 15.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            goodDetailGetx.goodDetailData[
                                                    'goodComments'][index]
                                                ['userName'],
                                            style: myTextStyle(
                                                28, 0xff666666, true),
                                          ),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Text(
                                            goodDetailGetx.goodDetailData[
                                                    'goodComments'][index]
                                                ['comments'],
                                            style: myTextStyle(
                                                28, 0xff666666, false),
                                          ),
                                          SizedBox(
                                            height: 10.w,
                                          ),
                                          Text(
                                            Format.formatDate(
                                                goodDetailGetx.goodDetailData[
                                                        'goodComments'][index]
                                                    ['discussTime']),
                                            style: myTextStyle(
                                                26, 0xff999999, false),
                                          ),
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) => Divider(
                                      color: Colors.grey[400],
                                      height: 1.w,
                                      thickness: 1.w,
                                    ),
                                itemCount: goodDetailGetx
                                    .goodDetailData['goodComments'].length)
                            : Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 40.w),
                                child: Center(
                                  child: Text(
                                    '暂时还没有评论喔！',
                                    style: myTextStyle(28, 0xff666666, false),
                                  ),
                                ),
                              ),
                        _bottomImg(
                            goodDetailGetx.goodDetailData['advertesPicture']
                                ['PICTURE_ADDRESS'])
                      ],
                    ),
                  ),
                ]),
              )
            ]),
      ],
    );
  }

  Widget _bottomImg(String imgUrl) {
    return Image.network(
      imgUrl,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }
}
