import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:flutter_bxsh/getx_controller/searchGoods_getx.dart';

class SearchGoodsWidget extends StatelessWidget {
  const SearchGoodsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchGoodsController searchGoodsController =
        Get.put(SearchGoodsController());

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    Map parameters = Get.arguments;

    searchGoodsController.setSearchWord(parameters['text']);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          parameters['text'],
          style: myTextStyle(34, 0xffffffff, true),
        ),
      ),
      body: FutureBuilder(
          future: searchGoodsController.getSearchGoods(_refreshController),
          builder: (context, snapshot) {
            return ProgressDialog(
              loading: !snapshot.hasData,
              child: SmartRefresher(
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
                      contentWidget = CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      textContent = "加载失败，请重新刷新加载!";
                    } else if (mode == LoadStatus.canLoading) {
                      textContent = "加载中...";
                    } else {
                      textContent = "暂无更多数据!";
                    }
                    return Container(
                      height: 55.0,
                      child: Center(
                          child: textContent != ''
                              ? Text(textContent,
                                  style: myTextStyle(
                                      26,
                                      Theme.of(context).accentColor.value,
                                      false))
                              : contentWidget),
                    );
                  },
                ),
                onRefresh: () =>
                    searchGoodsController.onRefresh(_refreshController),
                onLoading: () =>
                    searchGoodsController.onLoading(_refreshController),
                child: Wrap(
                    spacing: 10.w,
                    runSpacing: 10.w,
                    children: List.generate(
                        searchGoodsController.searchGoodsList.length, (index) {
                      return Container(
                        width: 370.w,
                        alignment: Alignment.center,
                        color: Colors.white,
                        padding: EdgeInsets.only(bottom: 30.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              searchGoodsController.searchGoodsList[index]
                                  ['image'],
                              fit: BoxFit.fitWidth,
                              width: 300.w,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "${searchGoodsController.searchGoodsList[index]['goodsName']}",
                                // 文字超出最大宽度显示省略号
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // 文字超出最大宽度显示省略号
                                style: myTextStyle(28,
                                    Theme.of(context).accentColor.value, false),
                              ),
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "￥${searchGoodsController.searchGoodsList[index]['PRESENT_PRICE']}",
                                  style: myTextStyle(28, 0xff333333, false),
                                ),
                                Text(
                                  "￥${searchGoodsController.searchGoodsList[index]['price']}",
                                  style: myTextStyle(28, 0xff999999, false,
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })),
              ),
            );
          }),
    );
  }
}
