import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: true,
        builder: () => MaterialApp(
              title: '百姓生活+',
              theme: ThemeData(
                  primaryColor: Color(0xFFE50078),
                  accentColor: Color(0xFFE50078),
                  scaffoldBackgroundColor: Color(0xfff4f4f4),
                  bottomAppBarColor: Color(0xffffffff),
                  backgroundColor: Color(0xffffffff),
                  dialogBackgroundColor: Color(0xffffffff),
                  dividerColor: Color(0xffececec),
                  fontFamily: 'PTSans',
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Color(0xFFE50078),
                      unselectedItemColor: Color(0xff707070),
                      selectedLabelStyle: TextStyle(fontSize: 26.sp),
                      unselectedLabelStyle: TextStyle(fontSize: 26.sp))),
              home: MyHomePage(),
            ));
  }
}
