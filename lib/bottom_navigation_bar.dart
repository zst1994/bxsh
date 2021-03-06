import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/img_asset.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/bottom_nav_getx.dart';

class HomePageBottomNavigationBar extends StatelessWidget {
  final List bottomNavigationData = [
    {'text': '首页', 'ImgKey': 'home'},
    {'text': '分类', 'ImgKey': 'ification'},
    {'text': '购物车', 'ImgKey': 'cart'},
    {'text': '会员中心', 'ImgKey': 'membership'},
  ];

  final BottomNavController bottomNavGetx = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          // 添加type属性解决字体不显示问题
          type: BottomNavigationBarType.fixed,
          items: _bottomNavItems(),
          currentIndex: bottomNavGetx.count.value,
          onTap: (int index) {
            bottomNavGetx.increment(index);
          },
        ));
  }

  List<BottomNavigationBarItem> _bottomNavItems() {
    return List.generate(bottomNavigationData.length, (index) {
      return BottomNavigationBarItem(
        backgroundColor: Colors.white,
        activeIcon: ImgAsset(
            imgUrl: 'assets/images/' +
                bottomNavigationData[index]['ImgKey'] +
                '_sel.webp'),
        icon: ImgAsset(
            imgUrl: 'assets/images/' +
                bottomNavigationData[index]['ImgKey'] +
                '.webp'),
        label: bottomNavigationData[index]['text'],
      );
    });
  }
}
