import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bxsh/common/toast_view.dart';

final String baseUrl = "https://wxmini.baixingliangfan.cn";

Future httpPost(String url, Map formData, Function callBack) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded").toString();
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      callBack(response.data);
      return "完成加载";
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    shortToast("客官你吓到人家了，稍后再来咯！");
  }
}

Future httpGet(String requestUrl, {Map<String, dynamic> urlParas}) async {
  try {
    Response response;

    var httpHeaders = {
      'Host': 'wxmini.baixingliangfan.cn',
      'Connection': 'keep-alive',
      'User-Agent':
          'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36 MicroMessenger/7.0.9.501 NetType/WIFI MiniProgramEnv/Windows WindowsWechat',
      'content-type': 'application/json',
      'Referer':
          'https://servicewechat.com/wxb6ec0fa3b296a9f3/95/page-frame.html',
      'Accept-Encoding': 'gzip, deflate, br'
    };

    Map<String, dynamic> paras = urlParas ?? {};

    Dio dio = new Dio();
    dio.options.headers = httpHeaders;
    dio.options.responseType = ResponseType.plain;

    response = await dio.get(baseUrl + requestUrl, queryParameters: paras);
    if (response.statusCode == 200) {
      return response;
    } else {
      shortToast("资源获取失败");
    }
  } catch (e) {
    shortToast("客官你吓到人家了，稍后再来咯！");
  }
}
