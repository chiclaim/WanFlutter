import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/bean/paging_bean.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';
import 'package:wanflutter/module/home/bean/home_banner_bean.dart';
import 'package:wanflutter/module/home/bean/top_bean.dart';

class HomeApi {
  // 请求文章列表
  Future<ResponseResult> requestArticleList(int index,
      {int pageSize = 20}) async {
    return await HttpClient.request(
      RequestOption("/article/list/$index/json",
          queryParameters: {"page_size": pageSize}),
      parseData: (data) => Paging.fromJson(data),
    );
  }

  /// 请求置顶文章
  Future<ResponseResult> requestTop() async {
    return await HttpClient.request(
      RequestOption("/article/top/json"),
      parseData: (data) => data?.map<Top>((e) => Top.fromJson(e)).toList(),
    );
  }

  /// 请求Banner
  Future<ResponseResult> requestBanner() async {
    return await HttpClient.request(
      RequestOption("/banner/json"),
      parseData: (data) =>
          data?.map<HomeBanner>((e) => HomeBanner.fromJson(e)).toList(),
    );
  }
}
