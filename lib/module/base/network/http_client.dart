import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/base_url.dart';
import 'package:wanflutter/module/base/network/network_manager.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class HttpClient {
  /// wanandroid.com open api
  static const _defaultBaseUrl = WanBaseUrl();

  static Future<ResponseResult> request<T>(RequestOption requestOption,
      {BaseUrl baseUrl = _defaultBaseUrl,
      dynamic Function(dynamic data)? parseData}) async {
    int? statusCode = -1;
    final network = NetworkManager.obtainNetwork(baseUrl);
    try {
      final responseInfo = await network.request(requestOption);
      statusCode = responseInfo.statusCode;
      if (responseInfo.statusCode == 200) {
        // 解析业务数据
        if (parseData != null && responseInfo.data!=null) {
          responseInfo.data.data = parseData(responseInfo.data.data);
        }
        return responseInfo.data;
      }
    } on Exception catch (e) {
      return ResponseResult(
          ok: false, errorMsg: network.humanizeNetworkError(e));
    }
    return ResponseResult(ok: false, errorMsg: "服务器请求错误[($statusCode)]");
  }
}
