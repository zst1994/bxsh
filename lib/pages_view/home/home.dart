import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/loading_view.dart';
import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:flutter_bxsh/model/on_launch_mini_entity.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getEmptyContaine(),
        builder: (context, snapshot) {
          return ProgressDialog(
            loading: !snapshot.hasData,
            child: Center(
              child: Obx(() => Text("当前页面：" + c.count.value.toString())),
            ),
          );
        });
  }

  Future _getEmptyContaine() async {
    await DioManager.getInstance().post<OnLaunchMiniEntity>(
        "/baixing/wxmini/onLaunchMini", {}, onSuccess: (data) {
      print("================${data.sharePic.pictureAddress}===============");
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
}
