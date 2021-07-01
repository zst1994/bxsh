import 'package:flutter/material.dart';
import 'package:flutter_bxsh/components/img_asset.dart';
import 'package:flutter_bxsh/components/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddShopCarWidget extends StatelessWidget {
  const AddShopCarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;

    // Postioned限制left:0,right:0,这样就充满父Widget 而且不会报错
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          width: sizeWidth,
          height: 120.w,
          child: Row(
            children: [
              Container(
                width: sizeWidth * 0.2,
                height: 120.w,
                color: Colors.white,
                child: Center(
                    child: ImgAsset(
                  imgUrl: 'assets/images/shop_cart.webp',
                  imgW: 60,
                  fit: BoxFit.fitWidth,
                )),
              ),
              Container(
                width: sizeWidth * 0.4,
                height: 120.w,
                color: Colors.green,
                child: Center(
                  child: Text(
                    '加入购物车',
                    style: myTextStyle(30, 0xffffffff, false),
                  ),
                ),
              ),
              Container(
                width: sizeWidth * 0.4,
                height: 120.w,
                color: Colors.red,
                child: Center(
                  child: Text(
                    '立即购买',
                    style: myTextStyle(30, 0xffffffff, false),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
