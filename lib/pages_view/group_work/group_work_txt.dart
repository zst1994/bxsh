import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/getx_controller/group_work_getx.dart';

class GroupWorkTxt extends StatelessWidget {
  GroupWorkTxt({Key key}) : super(key: key);

  final GroupWorkController groupWorkGetx = Get.put(GroupWorkController());

  @override
  Widget build(BuildContext context) {
    TextStyle _lightStyle = myTextStyle(26, 0xff666666, false);
    TextStyle _darkStyle =
        myTextStyle(26, Theme.of(context).accentColor.value, false);

    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.w, color: Theme.of(context).dividerColor))),
            child: Center(
              child: Text(
                '主题：${groupWorkGetx.groupBuy['groupBuy']['title']}',
                style:
                    myTextStyle(30, Theme.of(context).accentColor.value, false),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child:
                Text.rich(TextSpan(text: '活动时间：', style: _darkStyle, children: [
              TextSpan(text: '从 ', style: _lightStyle, children: [
                TextSpan(
                    text: groupWorkGetx.groupBuy['groupBuy']['time_begin_txt'],
                    style: _darkStyle,
                    children: [
                      TextSpan(text: ' 开始，到 ', style: _lightStyle, children: [
                        TextSpan(
                            text: groupWorkGetx.groupBuy['groupBuy']
                                ['time_end_txt'],
                            style: _darkStyle,
                            children: [
                              TextSpan(text: ' 结束', style: _lightStyle)
                            ])
                      ])
                    ])
              ])
            ])),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1.w, color: Theme.of(context).dividerColor))),
            child: Text(
              '活动介绍：',
              style: _darkStyle,
            ),
          ),
          Html(
            data: groupWorkGetx.groupBuy['groupBuy']['suggests'],
            style: {
              'p': Style(
                  backgroundColor: Color(
                    0xffe3f1f2,
                  ),
                  margin: EdgeInsets.all(0))
            },
          )
        ],
      ),
    );
  }
}
