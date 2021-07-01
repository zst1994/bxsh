import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImgAsset extends StatelessWidget {
  final String imgUrl;
  final double imgW;
  final double imgH;
  final BoxFit fit;
  final Color imgColor;

  ImgAsset(
      {Key key,
      this.imgUrl,
      this.imgW = 48,
      this.imgH = 48,
      this.fit,
      this.imgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imgUrl,
        fit: fit ?? BoxFit.fill,
        width: imgW.w,
        height: imgH.w,
        color: imgColor ?? null);
  }
}
