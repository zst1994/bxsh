import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/common/textStyle.dart';

class GoodTipWidget extends StatelessWidget {
  const GoodTipWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.w),
      padding: EdgeInsets.all(20.w),
      color: Colors.white,
      child: Text(
        '说明：> 急速送达 > 正品保证',
        style: myTextStyle(28, 0xffFF6347, false),
      ),
    );
  }
}
