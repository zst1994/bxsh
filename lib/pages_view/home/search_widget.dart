import 'package:flutter/material.dart';
import 'package:flutter_bxsh/common/regExp.dart';
import 'package:flutter_bxsh/common/toast_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/common/textStyle.dart';
import 'package:get/get.dart';

// 顶部搜索
class SearchWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController(); //声明controller

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _addressIcon(),
          _searchKeyWords(context),
          _searchBtn(context),
        ],
      ),
    );
  }

  Widget _addressIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () {},
        child: Image.asset(
          'assets/images/location.png',
          width: 45.w,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _searchKeyWords(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.w),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).accentColor, width: 1.w))),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 70.w),
          child: TextField(
            controller: controller,
            cursorWidth: 3.w,
            cursorRadius: Radius.circular(10.w),
            cursorColor: Theme.of(context).accentColor,
            style: myTextStyle(30, 0xff333333, false),
            scrollPadding: EdgeInsets.all(0),
            decoration: InputDecoration(
                hintText: '搜索喜欢的商品吧',
                hintStyle: myTextStyle(28, 0xff999999, false),
                //textField设置了外边框，textField的内容就会居中显示
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                //textField设置了外边框，textField的内容就会居中显示
                contentPadding: EdgeInsets.symmetric(vertical: 0)),
            onEditingComplete: () => _searchTap(context),
          ),
        ),
      ),
    );
  }

  Widget _searchBtn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: InkWell(
          onTap: () => _searchTap(context),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.w),
            child: Text(
              '搜索',
              style: myTextStyle(28, 0xffffffff, false),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(8.w))),
          ),
        ));
  }

  _searchTap(BuildContext context) {
    String searchWords = stringTrimExp(controller.text);
    if (searchWords.length > 0) {
      // 隐藏键盘
      FocusScope.of(context).requestFocus(FocusNode());
      Get.toNamed("/searchGoods", arguments: {'text': searchWords});
    } else {
      shortToast('请输入关键词进行搜索');
      controller.text = '';
    }
  }
}
