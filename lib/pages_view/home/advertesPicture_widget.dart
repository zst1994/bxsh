import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bxsh/getx_controller/homePageContent_getx.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertesPictureWidget extends StatelessWidget {
  const AdvertesPictureWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageContentController>(builder: (controller) {
      return Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.network(
                controller.advertesPicture.value,
                fit: BoxFit.fitWidth,
              ),
              InkWell(
                onTap: () {
                  _makePhoneCall(
                      'tel:${controller.shopInfo['leaderPhone'] ?? ''}');
                },
                child: Image.network(
                  controller.shopInfo['leaderImage'] ?? '',
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ));
    });
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
