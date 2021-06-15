import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';

class Ification extends StatelessWidget {
  final BottomNavController bottomNavGetx = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(bottomNavGetx.count.value.toString())),
    );
  }
}
