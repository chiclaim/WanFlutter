import 'package:wanflutter/library/network/method.dart';
import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';
import 'package:wanflutter/module/mine/bean/paging_coin_bean.dart';
import 'package:wanflutter/module/mine/bean/user_bean.dart';

class UserApi {
  // 用户登录
  Future<ResponseResult> login(String username, String password) async {
    final ResponseResult data = await HttpClient.request(
      RequestOption("/user/login",
          method: Method.post,
          queryParameters: {"username": username, "password": password}),
      parseData: (data) => User.fromJson(data),
    );
    return data;
  }

  /// 积分记录列表
  Future<ResponseResult> requestCoinRecord(int index,
      {int pageSize = 20}) async {
    return await HttpClient.get(
      "/lg/coin/list/$index/json",
      parseData: (data) => PagingCoin.fromJson(data),
    );
  }
}
