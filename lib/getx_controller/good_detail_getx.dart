import 'package:flutter_bxsh/components/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';

class GoodDetailController extends GetxController {
  RxMap goodDetailData = {}.obs;

  // 获取数据
  Future getGoodDetail(String goodId) async {
    await DioManager.getInstance()
        .post("/baixing/wxmini/getGoodDetailById", {'goodId': goodId},
            onSuccess: (data) {
      print(data);
      goodDetailData.assignAll(data);
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
