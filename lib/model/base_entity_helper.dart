
import 'package:flutter_bxsh/generated/json/base/json_convert_content.dart';

import 'base_entity.dart';

baseEntityFromJson<T>(BaseEntity<T> data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = int.parse(json['code']);
  }
  if (json['message'] != null) {
    data.message = json['message']?.toString();
  }
  if (json['data'] != null) {
    data.data = JsonConvert.fromJsonAsT<T>(json['data']);
  }
  return data;
}

Map<String, dynamic> baseEntityToJson(BaseEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['message'] = entity.message;
  if (entity.data != null) {
    data['data'] = entity.data.toJson();
  }
  return data;
}
