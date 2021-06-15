import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/bottom_navigation_bar.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:flutter_bxsh/pages_view/home/home.dart';
import 'package:flutter_bxsh/pages_view/class_ification/ification.dart';
import 'package:flutter_bxsh/pages_view/shopping_cart/shopping_cart.dart';
import 'package:flutter_bxsh/pages_view/membership_center/membership.dart';

class MyHomePage extends StatelessWidget {
  final List<Widget> _children = [
    Home(),
    Ification(),
    ShoppingCart(),
    Membership()
  ];

  @override
  Widget build(BuildContext context) {
    final Controller _getC = Get.put(Controller());

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: DiffAppBarHeight(
        appBarTitle: "百姓生活+",
        leadingBool: false,
        leadingTapResult: {},
      ),
      body: Center(
        child: Obx(() => _children[_getC.count.value]),
      ),
      bottomNavigationBar:
          HomePageBottomNavigationBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
