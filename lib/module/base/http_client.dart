import 'package:wanflutter/library/network/exception.dart';
import 'package:wanflutter/library/network/network.dart';
import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/response_result.dart';

enum Host { wan }

class HttpClient {
  static final wanHttp =
      Network(baseUrl: "https://www.wanandroid.com").addLogInterceptor();

  static final hosts = Map<String, Network>();

  static Network of(Host host) {
    var network = hosts[host.name];
    if (network == null) {
      network = mappingHost(host);
      hosts[host.name] = network;
    }
    return network;
  }

  static Network mappingHost(Host host) {
    switch (host) {
      case Host.wan:
        return Network(baseUrl: "https://www.wanandroid.com")
            .addLogInterceptor();
      default:
        throw UnsupportedException("Unsupported Host.${host.name}");
    }
  }

  static Future<ResponseResult> request(RequestOption requestOption,
      {Host host = Host.wan}) async {
    final responseInfo = await of(host).request(requestOption);

    // 如果是json，判断 code
    // 可能不同的 host ，code值不同，例如 code=1 表示成功，有的 code=0 表示成功
    // 所以根据不同的 host 来判断 code
    if (responseInfo.statusCode == 200) {

    } else {

    }

    return ResponseResult(ok: false, responseInfo: responseInfo);
  }
}
