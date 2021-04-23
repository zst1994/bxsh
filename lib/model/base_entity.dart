import 'package:flutter_bxsh/generated/json/base/json_convert_content.dart';

class BaseEntity<T> with JsonConvert<BaseEntity> {
  //  判断标示
  int code;

  //    提示信息
  String message;

  //显示数据（用户需要关心的数据）
  T data;

  bool isOk() => code == CORRECT_CODE;

  static const int CORRECT_CODE = 0;
}
