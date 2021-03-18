import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:get/get.dart';

class Membership extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final Controller c = Get.put(Controller());

        return Center(
            child: Obx(() => Text(c.count.value.toString())),
        );
    }
}