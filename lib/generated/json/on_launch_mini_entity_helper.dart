import 'package:flutter_bxsh/model/on_launch_mini_entity.dart';

onLaunchMiniEntityFromJson(OnLaunchMiniEntity data, Map<String, dynamic> json) {
	if (json['sharePic'] != null) {
		data.sharePic = new OnLaunchMiniSharePic().fromJson(json['sharePic']);
	}
	if (json['buyTime'] != null) {
		data.buyTime = json['buyTime'].toString();
	}
	if (json['sendFee'] != null) {
		data.sendFee = new OnLaunchMiniSendFee().fromJson(json['sendFee']);
	}
	return data;
}

Map<String, dynamic> onLaunchMiniEntityToJson(OnLaunchMiniEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.sharePic != null) {
		data['sharePic'] = entity.sharePic.toJson();
	}
	data['buyTime'] = entity.buyTime;
	if (entity.sendFee != null) {
		data['sendFee'] = entity.sendFee.toJson();
	}
	return data;
}

onLaunchMiniSharePicFromJson(OnLaunchMiniSharePic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS'].toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE'].toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType'] is String
				? int.tryParse(json['urlType'])
				: json['urlType'].toInt();
	}
	return data;
}

Map<String, dynamic> onLaunchMiniSharePicToJson(OnLaunchMiniSharePic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

onLaunchMiniSendFeeFromJson(OnLaunchMiniSendFee data, Map<String, dynamic> json) {
	if (json['chargeStartFee'] != null) {
		data.chargeStartFee = json['chargeStartFee'].toString();
	}
	if (json['deliveryFee'] != null) {
		data.deliveryFee = json['deliveryFee'].toString();
	}
	return data;
}

Map<String, dynamic> onLaunchMiniSendFeeToJson(OnLaunchMiniSendFee entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['chargeStartFee'] = entity.chargeStartFee;
	data['deliveryFee'] = entity.deliveryFee;
	return data;
}