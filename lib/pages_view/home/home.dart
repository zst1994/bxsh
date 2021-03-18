import 'package:flutter/material.dart';
import 'package:flutter_bxsh/getx_controller/bottom_navigationBar.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  // 页面有滚动列表切换页面后返回保存当前滚动位置
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Center(
      child: Obx(() => Text("当前：" + c.count.value.toString())),
    );
  }
}
