import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bxsh/components/textStyle.dart';

class CouponsBtn extends StatelessWidget {
  const CouponsBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.w),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).accentColor, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              color: Color(0xffFFC0CB),
            ),
            child: Text(
              '使用优惠券',
              style: myTextStyle(26, 0XFFFFFFFF, false),
            ),
          ),
        ),
      ],
    );
  }
}
