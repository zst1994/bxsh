import 'package:flutter_bxsh/generated/json/base/json_convert_content.dart';
import 'package:flutter_bxsh/generated/json/base/json_filed.dart';

class OnLaunchMiniEntity with JsonConvert<OnLaunchMiniEntity> {
	OnLaunchMiniSharePic sharePic;
	String buyTime;
	OnLaunchMiniSendFee sendFee;
}

class OnLaunchMiniSharePic with JsonConvert<OnLaunchMiniSharePic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class OnLaunchMiniSendFee with JsonConvert<OnLaunchMiniSendFee> {
	String chargeStartFee;
	String deliveryFee;
}
