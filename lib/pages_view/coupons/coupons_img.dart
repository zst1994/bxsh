import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bxsh/getx_controller/coupons_getx.dart';

class CouponsImg extends StatelessWidget {
  CouponsImg({Key key}) : super(key: key);

  final CouponsController couponsGetx = Get.put(CouponsController());

  @override
  Widget build(BuildContext context) {
    return Image.network(
      couponsGetx.picAddress.value,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
