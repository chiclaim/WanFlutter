import 'package:wanflutter/module/article/bean/paging_collect_bean.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class ArticleApi {
  /// 收藏站内文章
  Future<ResponseResult> collectInnerArticle(int id) async {
    return await HttpClient.post(
      "/lg/collect/$id/json",
    );
  }

  /// 收藏列表
  Future<ResponseResult> requestCollectList(int index,
      {int pageSize = 20}) async {
    return await HttpClient.get(
      "/lg/collect/list/$index/json",
      parseData: (data) => PagingCollect.fromJson(data),
    );
  }
}
