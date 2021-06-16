import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/bottom_navigation_bar.dart';
import 'package:flutter_bxsh/getx_controller/bottom_nav_getx.dart';
import 'package:flutter_bxsh/pages_view/home/home.dart';
import 'package:flutter_bxsh/pages_view/class_ification/ification.dart';
import 'package:flutter_bxsh/pages_view/shopping_cart/shopping_cart.dart';
import 'package:flutter_bxsh/pages_view/membership_center/membership.dart';

class MyHomePage extends StatelessWidget {
  final List _children = [
    {'name': '百姓生活+', 'page': Home()},
    {'name': '商品分类', 'page': Ification()},
    {'name': '购物车', 'page': ShoppingCart()},
    {'name': '会员中心', 'page': Membership()},
  ];

  final BottomNavController bottomNavGetx = Get.put(BottomNavController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: DiffAppBarHeight(
        customTitleBool: true,
        customTitleWidget: Obx(() => Text(
              _children[bottomNavGetx.count.value]['name'],
              style: myTextStyle(34, 0xffffffff, true),
            )),
        leadingBool: false,
        leadingTapResult: {},
      ),
      body: Center(
        child: Obx(() => _children[bottomNavGetx.count.value]['page']),
      ),
      bottomNavigationBar:
          HomePageBottomNavigationBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
