import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller _getC = Get.put(Controller());

    return Center(
      child: Obx(() => Text(_getC.count.value.toString())),
    );
  }
}
