import 'package:flutter_bxsh/model/base_entity.dart';
import 'package:flutter_bxsh/generated/json/base/json_convert_content.dart';

baseBeanFromJson<T>(BaseBean<T> data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = JsonConvert.fromJsonAsT<T>(json['data']);
	}
	return data;
}

Map<String, dynamic> baseBeanToJson(BaseBean entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] = entity.data?.toJson();
	return data;
}