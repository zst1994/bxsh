import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/group_work_getx.dart';

class GroupWorkImg extends StatelessWidget {
  GroupWorkImg({Key key}) : super(key: key);

  final GroupWorkController groupWorkGetx = Get.put(GroupWorkController());

  @override
  Widget build(BuildContext context) {
    return Image.network(
      groupWorkGetx.groupBuy['groupBuy']['image_top'],
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
