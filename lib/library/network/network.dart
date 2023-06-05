import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/library/network/response.dart';

abstract class INetwork {
  // 普通网络请求
  Future<ResponseInfo<T>> request<T>(RequestOption requestOption);

  // 下载
  void upload();

  /// 上传
  void download();

  // 网络错误信息转成用户可理解的信息
  String humanizeNetworkError(Exception exception);

  
}
