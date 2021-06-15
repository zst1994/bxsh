import 'package:flutter_bxsh/components/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  RxInt count = 0.obs;
  RxBool showload = false.obs;

  // 获取数据
  Future getCouponsPic() async {
    await DioManager.getInstance().post("/baixing/wxmini/fujiCouponsPic", {},
        onSuccess: (data) {
      print(data);
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
