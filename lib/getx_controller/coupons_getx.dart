import 'package:flutter_bxsh/components/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  RxString picAddress = "".obs;

  RxList couponsGetByself = [].obs;

  // 获取数据
  Future getCouponsPic() async {
    await DioManager.getInstance().post("/baixing/wxmini/fujiCouponsPic", {},
        onSuccess: (data) {
      picAddress.value = data['PICTURE_ADDRESS'];
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });

    await DioManager.getInstance().post("/baixing/wxmini/fujiCouponsGetByself",
        {'userId': '', 'scene': '', 'page': 1, 'qrcode': 0}, onSuccess: (data) {
      couponsGetByself.addAll(data);
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
