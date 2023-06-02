import 'package:dio/dio.dart';
import 'package:wanflutter/library/network/abstract.dart';
import 'package:wanflutter/library/network/exception.dart';
import 'package:wanflutter/library/network/method.dart';
import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/library/network/response.dart';

///
/// 通用网络功能封装
///
class Network implements INetwork {
  final Dio _dio = Dio();

  static const int timeout = 15000;

  final String baseUrl;

  Network({required this.baseUrl}) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.sendTimeout = const Duration(milliseconds: timeout);
    _dio.options.receiveTimeout = const Duration(milliseconds: timeout);
    _dio.options.connectTimeout = const Duration(milliseconds: timeout);
  }

  Network addLogInterceptor() {
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    return this;
  }

  @override
  void download() {}

  @override
  void upload() {}

  @override
  Future<ResponseInfo<T>> request<T>(RequestOption requestOption) async {
    switch (requestOption.method) {
      case Method.get:
        return convertResponse<T>(
            requestOption, await _dio.get(requestOption.path));
      case Method.post:
        return convertResponse<T>(
            requestOption, await _dio.post(requestOption.path));
      case Method.head:
        return convertResponse<T>(
            requestOption, await _dio.head(requestOption.path));
      case Method.put:
        return convertResponse<T>(
            requestOption, await _dio.put(requestOption.path));
      case Method.patch:
        return convertResponse<T>(
            requestOption, await _dio.patch(requestOption.path));
      case Method.delete:
        return convertResponse<T>(
            requestOption, await _dio.delete(requestOption.path));
      case Method.connect:
      case Method.options:
      case Method.trace:
        throw UnsupportedException(
            "Unsupported HTTP method: ${requestOption.method.name}");
    }
  }

  ResponseInfo<T> convertResponse<T>(
      RequestOption requestOption, Response<T> response) {
    return ResponseInfo(
        data: response.data,
        requestOptions: requestOption,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        isRedirect: response.isRedirect,
        extra: response.extra);
  }
}
