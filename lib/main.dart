import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bxsh/pages_view/group_work/group_work_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_bxsh/pages_view/coupons/coupons_widget.dart';
import 'package:flutter_bxsh/pages_view/good_detail/good_detail_widget.dart';
import 'package:flutter_bxsh/pages_view/search_goods/search_goods_widget.dart';
import 'package:flutter_bxsh/my_home_page.dart';

//Get有两个不同的状态管理器：简单的状态管理器（GetBuilder）和响应式状态管理器（GetX）
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GetPage> getPages = [
      GetPage(name: '/', page: () => MyHomePage()),
      GetPage(name: '/coupons', page: () => CouponsWidget()),
      GetPage(name: '/searchGoods', page: () => SearchGoodsWidget()),
      GetPage(name: '/goodDetail', page: () => GoodDetailWidget()),
      GetPage(name: '/groupWork', page: () => GroupWorkWidget()),
    ];

    // 方式二
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(750, 1334),
    //     orientation: Orientation.portrait);

    // 方式一
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        // allowFontScaling: true,
        builder: () => RefreshConfiguration(
            headerBuilder: () =>
                WaterDropHeader(), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
            footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
            headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
            springDescription: SpringDescription(
                stiffness: 170,
                damping: 16,
                mass: 1.9), // 自定义回弹动画,三个属性值意义请查询flutter api
            maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
            maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
            enableScrollWhenRefreshCompleted:
                true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
            enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
            hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
            enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
            child: GetMaterialApp(
              // 从右侧向左滑入
              defaultTransition: Transition.rightToLeft,
              initialRoute: "/",
              getPages: getPages,
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
              // home: MyHomePage(),
            )));
  }
}
