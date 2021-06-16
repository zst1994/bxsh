import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/group_work_getx.dart';
import 'package:flutter_bxsh/components/textStyle.dart';

class GroupBuyGoods extends StatelessWidget {
  GroupBuyGoods({Key key}) : super(key: key);

  final GroupWorkController groupWorkGetx = Get.put(GroupWorkController());

  @override
  Widget build(BuildContext context) {
    TextStyle _lightStyle = myTextStyle(26, 0xff666666, false);
    TextStyle _darkStyle =
        myTextStyle(26, Theme.of(context).accentColor.value, false);

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: groupWorkGetx.groupBuy['groupBuyGoods'].length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
            color: Colors.white,
            height: 240.w,
            padding: EdgeInsets.all(30.w),
            child: Row(
              children: [
                Container(
                  width: 200.w,
                  padding: EdgeInsets.all(5.w),
                  margin: EdgeInsets.only(right: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w)),
                      border: Border.all(
                          width: 1.w, color: Theme.of(context).dividerColor)),
                  child: Image.network(
                    groupWorkGetx.groupBuy['groupBuyGoods'][i]['image'],
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        groupWorkGetx.groupBuy['groupBuyGoods'][i]['name'],
                        style: myTextStyle(28, 0xff444444, false),
                      ),
                      Text.rich(TextSpan(
                          text: groupWorkGetx.groupBuy['groupBuyGoods'][i]
                                  ['type_price_txt'] +
                              '价',
                          style: myTextStyle(
                              20, Theme.of(context).accentColor.value, false),
                          children: [
                            TextSpan(
                                text:
                                    '￥${groupWorkGetx.groupBuy['groupBuyGoods'][i]['price_groupbuy']}',
                                style: _darkStyle,
                                children: [
                                  TextSpan(
                                      text:
                                          '     原价：￥${groupWorkGetx.groupBuy['groupBuyGoods'][i]['price_sale']}',
                                      style: _lightStyle)
                                ])
                          ])),
                      Text(
                        '剩余：${groupWorkGetx.groupBuy['groupBuyGoods'][i]['stock']}份，${groupWorkGetx.groupBuy['groupBuyGoods'][i]['ship_type_txt']}，限时付款。',
                        style: myTextStyle(26, 0xff666666, false),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
      separatorBuilder: (context, i) => Divider(
        color: Colors.grey[400],
        height: 1.w,
        thickness: 1.w,
      ),
    );
  }
}
