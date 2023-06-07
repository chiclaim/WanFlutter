import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class HomeApi {
  
  // 请求文章列表
  Future<ResponseResult> requestArticleList(int index,
      {int pageSize = 20}) async {
    return await HttpClient.request(RequestOption("/article/list/$index/json",
        queryParameters: {"page_size": pageSize}));
  }

  /// 请求置顶文章
  Future<ResponseResult> requestTop() async {
    return await HttpClient.request(RequestOption("/article/top/json"));
  }

  /// 请求Banner
  Future<ResponseResult> requestBanner() async {
    return await HttpClient.request(RequestOption("/banner/json"));
  }
}
