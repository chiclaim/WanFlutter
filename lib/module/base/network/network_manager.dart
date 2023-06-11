import 'package:wanflutter/library/network/network.dart';
import 'package:wanflutter/module/base/network/base_url.dart';
import 'package:wanflutter/module/base/network/dio/dio_network.dart';

class NetworkManager {
  static final _baseUrlMaps = <String, INetwork>{};

  /// 从 Network 缓存中获取 Network 实例，如果不存在，则创建
  static Future<INetwork> obtainNetwork(BaseUrl baseUrl) async {
    var network = _baseUrlMaps[baseUrl.key()];
    if (network == null) {
      network = (await DioNetwork.of(baseUrl: baseUrl.getBaseUrl()))
          .addLogInterceptor();
      _baseUrlMaps[baseUrl.key()] = network;
    }
    return network;
  }
}
