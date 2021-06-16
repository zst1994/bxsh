import 'package:flutter/material.dart';
import 'package:flutter_bxsh/pages_view/group_work/group_buy_goods.dart';
import 'package:flutter_bxsh/pages_view/group_work/group_work_txt.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/common/isEmpty.dart';
import 'package:flutter_bxsh/components/loading_view.dart';
import 'package:flutter_bxsh/components/diff_appBar_height.dart';
import 'package:flutter_bxsh/pages_view/group_work/group_work_img.dart';
import 'package:flutter_bxsh/getx_controller/group_work_getx.dart';

class GroupWorkWidget extends StatelessWidget {
  GroupWorkWidget({Key key}) : super(key: key);

  final GroupWorkController groupWorkGetx = Get.put(GroupWorkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DiffAppBarHeight(appBarTitle: '百姓生活+', leadingTapResult: {}),
      body: FutureBuilder(
          future: groupWorkGetx.getGroupBuy(),
          builder: (context, snapshot) {
            return ProgressDialog(
              loading: !snapshot.hasData,
              child: Obx(() => Empty.isEmpty(groupWorkGetx.groupBuy)
                  ? Container()
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        GroupWorkImg(),
                        GroupWorkTxt(),
                        GroupBuyGoods()
                      ],
                    )),
            );
          }),
    );
  }
}
