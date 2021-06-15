import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';

class Ification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller _getC = Get.put(Controller());

    return Center(
      child: Obx(() => Text(_getC.count.value.toString())),
    );
  }
}
