import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_bxsh/http/dio_manager.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchGoodsController extends GetxController {
  RxList searchGoodsList = [].obs;

  RxInt searchGoodsPage = 1.obs;

  RxString searchWord = ''.obs;

  setSearchWord(String text) {
    searchWord.value = text;
  }

  addSearchGoodsPage({int pageNum}) {
    searchGoodsPage.value = pageNum ?? this.searchGoodsPage.value + 1;
  }

  setSearchGoods(List data) {
    searchGoodsList.assignAll(data);
  }

  // 下拉刷新
  void onRefresh(_refreshController) async {
    addSearchGoodsPage(pageNum: 1);
    setSearchGoods([]);
    getSearchGoods(_refreshController);
    // 顶部指示器刷新成功,是否要还原底部没有更多数据状态
    _refreshController.refreshCompleted();
    // 刷新底部指示器状态为idle
    _refreshController.resetNoData();
  }

  //上拉加载
  void onLoading(_refreshController) async {
    getSearchGoods(_refreshController);
  }

// 获取数据
  Future getSearchGoods(RefreshController _refreshController) async {
    await DioManager.getInstance().post("/baixing/wxmini/searchGoods", {
      'page': searchGoodsPage.value,
      'text': searchWord.value
    }, onSuccess: (data) {
      if (data != null && data.length > 0) {
        List newListData = [];
        List oldList = searchGoodsList;
        newListData..addAll(oldList)..addAll(data);
        setSearchGoods(newListData);
        addSearchGoodsPage();
        // 底部指示器加载完成
        _refreshController.loadComplete();
      } else {
        shortToast('暂无更多数据');
        // 底部指示器进入一个没有更多数据的状态
        _refreshController.loadNoData();
      }
    }, onError: (code, error) {
      shortToast(error);
    });
    return "完成加载";
  }
  // 获取数据
}
