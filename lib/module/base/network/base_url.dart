import 'dart:convert';
import 'package:wanflutter/module/base/network/response_result.dart';

abstract class BaseUrl {
  const BaseUrl();

  /// base url
  String getBaseUrl();

  /// BaseUrl 对应的键. <p>
  /// 注意：key 用于唯一标识 BaseUrl，不同的 BaseUrl，使用不同的 key.
  String key();

  /// 解析 baseUrl 对应的数据格式
  Future<dynamic> parseData(dynamic responseData);

}

class WanBaseUrl implements BaseUrl {
  // 常量对象
  const WanBaseUrl();

  @override
  String getBaseUrl() {
    return "https://www.wanandroid.com";
  }

  @override
  String key() {
    return "wan";
  }

  @override
  Future parseData(responseData) async {
    //Map<String, dynamic> result = jsonDecode(responseData);
    Map<String, dynamic> result = responseData;
    final errorCode = result["errorCode"];
    final errorMsg = result["errorMsg"];
    final data = result["data"];
    return ResponseResult(
        ok: errorCode == 0,
        errorCode: (errorCode != null) ? errorCode.toString() : null,
        errorMsg: errorMsg,
        data: data);
  }
}
