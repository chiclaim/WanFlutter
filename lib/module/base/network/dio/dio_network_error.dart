import 'package:dio/dio.dart';
import 'package:wanflutter/library/network/network_erorr.dart';

class DioNetworkError implements NetworkError {
  @override
  String humanizeNetworkErorr(Exception exception) {
    final e = exception as DioError;
    switch (e.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return "网络请求超时";
      case DioErrorType.badResponse:
        return "服务器异常";
      case DioErrorType.cancel:
        return "请求取消";
      default:
        return "未知错误";
    }
  }
}
