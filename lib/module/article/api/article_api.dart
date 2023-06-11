import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

class AricleApi {
  // 收藏站内文章
  Future<ResponseResult> collectInnerArticle(int id) async {
    return await HttpClient.post(
      "/lg/collect/$id/json",
    );
  }
}
