import 'package:flutter_bxsh/model/basic_picture_orders_sum_fsize_entity.dart';

basicPictureOrdersSumFsizeEntityFromJson(BasicPictureOrdersSumFsizeEntity data, Map<String, dynamic> json) {
	if (json['qiniuToken'] != null) {
		data.qiniuToken = json['qiniuToken'].toString();
	}
	if (json['dayCount'] != null) {
		data.dayCount = json['dayCount'] is String
				? int.tryParse(json['dayCount'])
				: json['dayCount'].toInt();
	}
	if (json['orderCount'] != null) {
		data.orderCount = json['orderCount'] is String
				? int.tryParse(json['orderCount'])
				: json['orderCount'].toInt();
	}
	if (json['totalFsizeCount'] != null) {
		data.totalFsizeCount = json['totalFsizeCount'].toString();
	}
	if (json['surplusFsizeCount'] != null) {
		data.surplusFsizeCount = json['surplusFsizeCount'] is String
				? int.tryParse(json['surplusFsizeCount'])
				: json['surplusFsizeCount'].toInt();
	}
	if (json['pictureStatus'] != null) {
		data.pictureStatus = json['pictureStatus'] is String
				? int.tryParse(json['pictureStatus'])
				: json['pictureStatus'].toInt();
	}
	if (json['usageFsizeCount'] != null) {
		data.usageFsizeCount = json['usageFsizeCount'].toString();
	}
	return data;
}

Map<String, dynamic> basicPictureOrdersSumFsizeEntityToJson(BasicPictureOrdersSumFsizeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['qiniuToken'] = entity.qiniuToken;
	data['dayCount'] = entity.dayCount;
	data['orderCount'] = entity.orderCount;
	data['totalFsizeCount'] = entity.totalFsizeCount;
	data['surplusFsizeCount'] = entity.surplusFsizeCount;
	data['pictureStatus'] = entity.pictureStatus;
	data['usageFsizeCount'] = entity.usageFsizeCount;
	return data;
}