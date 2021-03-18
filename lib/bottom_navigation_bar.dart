import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  final List bottomNavigationData = [
    {'text': '首页', 'ImgKey': 'home'},
    {'text': '分类', 'ImgKey': 'ification'},
    {'text': '购物车', 'ImgKey': 'cart'},
    {'text': '会员中心', 'ImgKey': 'membership'},
  ];

  @override
  Widget build(BuildContext context) {
    final Controller getxController = Get.put(Controller());

    final List<BottomNavigationBarItem> bottomNavItems =
        List.generate(bottomNavigationData.length, (index) {
      return BottomNavigationBarItem(
        backgroundColor: Colors.white,
        activeIcon: Image.asset(
          'assets/images/' + bottomNavigationData[index]['ImgKey'] + '_sel.png',
          width: 48.w,
          height: 48.w,
        ),
        icon: Image.asset(
          'assets/images/' + bottomNavigationData[index]['ImgKey'] + '.png',
          width: 48.w,
          height: 48.w,
        ),
        label: bottomNavigationData[index]['text'],
      );
    });

    return Obx(() => BottomNavigationBar(
          // 添加type属性解决字体不显示问题
          type: BottomNavigationBarType.fixed,
          items: bottomNavItems,
          currentIndex: getxController.count.value,
          onTap: (int index) {
            getxController.increment(index);
          },
        ));
  }
}
