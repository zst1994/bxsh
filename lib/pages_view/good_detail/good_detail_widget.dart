import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoodDetailWidget extends StatelessWidget {
  const GoodDetailWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map parameters = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(parameters['goodsId']),
      ),
    );
  }
}
