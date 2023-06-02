import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/http_client.dart';

class HomeApi {
  void requestArticleList(int index, {int pageSize = 20}) async {
    final response = await HttpClient.wanHttp
        .request(RequestOption("/article/list/$index/json"));
    // print(response.data);
  }
}
