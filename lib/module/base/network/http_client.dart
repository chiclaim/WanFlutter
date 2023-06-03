import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/base_url.dart';
import 'package:wanflutter/module/base/network/network_manager.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class HttpClient {
  static Future<ResponseResult> request(RequestOption requestOption,
      {BaseUrl baseUrl = BaseUrl.wan}) async {
    int? statusCode = -1;
    final network = NetworkManager.obtainNetwork(baseUrl);
    try {
      final responseInfo = await network.request(requestOption);
      statusCode = responseInfo.statusCode;
      if (responseInfo.statusCode == 200) {
        return await baseUrl.parseData(responseInfo.data);
      }
    } on Exception catch (e) {
      return ResponseResult(
          ok: false, errorMsg: network.humanizeNetworkErorr(e));
    }
    return ResponseResult(ok: false, errorMsg: "服务器请求错误[($statusCode)]");
  }
}
