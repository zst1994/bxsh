import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/loading_view.dart';
import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return FutureBuilder(
        future: _onRefresh(),
        builder: (context, snapshot) {
          return ProgressDialog(
            loading: !snapshot.hasData,
            child: Center(
              child: Obx(() => Text("当前页面：" + c.count.value.toString())),
            ),
          );
        });
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("1111111");
    });
    shortToast('加载完成');
    return "完成";
  }
}
