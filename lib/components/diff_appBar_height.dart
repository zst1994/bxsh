import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_bxsh/components/img_asset.dart';

class DiffAppBarHeight extends StatelessWidget implements PreferredSizeWidget {
  // title文本大小
  final int appBarTitleSize;

  // title文本颜色
  final int appBarTitleColor;

  // 修改appBar高度
  final double appBarbottom;

  // 显示文本
  final String appBarTitle;

  final bool leadingBool;

  // 返回按钮icon路径
  final String leadImUrl;

  final bool appBarTitleFontWeight;

  // 文本只有一行内容时，若超过设置最大宽度，是否自动换行，true 为换行，false 为不换行；
  final bool softWrap;

  // 是否需要自定义导航栏title内容，默认false
  final bool customTitleBool;

  final bool automaticallyImplyLeading;

  // appBar背景色
  final Color backgroundColor;

  final Widget flexibleSpace;

  final Widget appBarBottomWidget;

  // 自定义导航栏title内容
  final Widget customTitleWidget;

  // 导航栏顶部右边按钮数组
  final List<Widget> actions;

  // 点击返回按钮的返回结果
  final Map<String, dynamic> leadingTapResult;

  // 状态栏模式
  final Brightness brightness;

  DiffAppBarHeight(
      {Key key,
      this.appBarTitle,
      this.appBarbottom = 0.0,
      this.actions,
      this.softWrap = false,
      this.flexibleSpace,
      this.backgroundColor,
      this.appBarTitleSize = 34,
      this.appBarTitleColor = 0xffffffff,
      this.appBarBottomWidget,
      this.leadingBool = true,
      this.leadImUrl = 'assets/images/fanhui_01@2x.webp',
      this.brightness = Brightness.light,
      this.customTitleBool = false,
      this.customTitleWidget,
      this.automaticallyImplyLeading = true,
      this.appBarTitleFontWeight = true,
      @required this.leadingTapResult})
      : super(key: key);

  @override
  //设置ios安卓不同机型的导航栏高度
  Size get preferredSize => Platform.isIOS
      ? Size.fromHeight(88.0.h + appBarbottom)
      : Size.fromHeight(kToolbarHeight + appBarbottom);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          elevation: 0.0, //去除顶部导航栏阴影
          centerTitle: true,
          brightness: brightness,
          backgroundColor: backgroundColor ?? Theme.of(context).accentColor,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leadingBool
              ? IconButton(
                  icon: ImgAsset(imgUrl: leadImUrl, imgW: 20, imgH: 34),
                  onPressed: () {
                    debugPrint(
                        "===========${leadingTapResult.toString()}============");
                    Get.back(result: leadingTapResult);
                  })
              : null,
          actions: actions,
          flexibleSpace: flexibleSpace,
          title: customTitleBool
              ? customTitleWidget
              : Text(
                  appBarTitle,
                  softWrap: softWrap,
                  style: myTextStyle(
                      appBarTitleSize, appBarTitleColor, appBarTitleFontWeight),
                ),
          bottom: appBarBottomWidget,
        ));
  }
}
