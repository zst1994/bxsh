import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final FontWeight fwBold = Platform.isIOS ? FontWeight.bold : FontWeight.w500;

//封装字体样式
TextStyle myTextStyle(int size, int mycolor, bool fw) {
  return TextStyle(
      fontSize: size.sp,
      color: Color(mycolor),
      fontWeight: fw ? fwBold : FontWeight.normal,
      fontFamily: fw ? "PingFang-SC-Bold" : "PingFang-SC-Medium");
}
