import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class HomeApi {
  Future<ResponseResult> requestArticleList(int index,
      {int pageSize = 20}) async {
    return await HttpClient.request(RequestOption("/article/list/$index/json"));
  }
}
