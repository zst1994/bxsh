import 'package:flutter/cupertino.dart';
import 'package:flutter_bxsh/components/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';

class GroupWorkController extends GetxController {
  RxMap groupBuy = {}.obs;

  // 获取数据
  Future getGroupBuy() async {
    await DioManager.getInstance().post(
        "/baixing/wxmini/getGroupBuy", {'gid': 'common'}, onSuccess: (data) {
      debugPrint('=======$data');
      groupBuy.assignAll(data);
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });

    return "完成加载";
  }
}
