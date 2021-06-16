import 'package:flutter_bxsh/components/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  RxString picAddress = "".obs;

  RxInt page = 1.obs;

  RxList couponsGetByself = [].obs;

  addPage({int pageNum}) {
    page.value = pageNum ?? this.page.value + 1;
  }

  // 下拉刷新
  void onRefresh(_refreshController) async {
    couponsGetByself.assignAll([]);
    addPage(pageNum: 1);
    getCouponsPic(_refreshController);
    // 顶部指示器刷新成功,是否要还原底部没有更多数据状态
    _refreshController.refreshCompleted();
    // 刷新底部指示器状态为idle
    _refreshController.resetNoData();
  }

  //上拉加载
  void onLoading(_refreshController) async {
    getCouponsGetByself(_refreshController);
  }

  // 获取数据
  Future getCouponsPic(_refreshController) async {
    await DioManager.getInstance().post("/baixing/wxmini/fujiCouponsPic", {},
        onSuccess: (data) {
      picAddress.value = data['PICTURE_ADDRESS'];
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });

    await getCouponsGetByself(_refreshController);

    return "完成加载";
  }

  Future getCouponsGetByself(_refreshController) async {
    await DioManager.getInstance().post("/baixing/wxmini/fujiCouponsGetByself",
        {'userId': '', 'scene': '', 'page': page, 'qrcode': 0},
        onSuccess: (data) {
      if (data.length > 0) {
        couponsGetByself.addAll(data);
        addPage();
        // 底部指示器加载完成
        _refreshController.loadComplete();
      } else {
        CustomToast.shortToast('暂无更多优惠券了！');
        // 底部指示器进入一个没有更多数据的状态
        _refreshController.loadNoData();
      }
    }, onError: (code, error) {
      CustomToast.shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
