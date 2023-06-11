// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanflutter/library/network/network.dart';
import 'package:wanflutter/library/network/exception.dart';
import 'package:wanflutter/library/network/method.dart';
import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/library/network/response.dart';
import 'package:wanflutter/module/base/network/response_result.dart';

///
/// 通用网络功能封装
///
class DioNetwork implements INetwork {
  final Dio _dio = Dio();
  static const int _timeout = 15000;
  final String baseUrl;

  DioNetwork._({required this.baseUrl});

  static Future<DioNetwork> of({required String baseUrl}) async {
    DioNetwork network = DioNetwork._(baseUrl: baseUrl);
    network._dio.options.baseUrl = baseUrl;
    network._dio.options.sendTimeout = const Duration(milliseconds: _timeout);
    network._dio.options.receiveTimeout = const Duration(milliseconds: _timeout);
    network._dio.options.connectTimeout = const Duration(milliseconds: _timeout);
    // cookie 处理（用于登录）
    final cookieJar = await _prepareJar(); //CookieJar();
    network._dio.interceptors.add(CookieManager(cookieJar));

    // 解析服务端返回的数据
    network._dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        if (e.statusCode == 200) {
          final responseData = e.data;
          Map<String, dynamic> result = responseData;
          final errorCode = result["errorCode"];
          final errorMsg = result["errorMsg"];
          final data = result["data"];
          e.data = ResponseResult(
              ok: errorCode == 0,
              errorCode: (errorCode != null) ? errorCode.toString() : null,
              errorMsg: errorMsg,
              data: data);
        }
        handler.next(e);
      },
    ));
    return network;
  }

  static Future<PersistCookieJar> _prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    return PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );
  }

  DioNetwork addLogInterceptor() {
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
            requestOption,
            await _dio.get(requestOption.path,
                queryParameters: requestOption.queryParameters));
      case Method.post:
        return convertResponse<T>(
            requestOption,
            await _dio.post(requestOption.path,
                data: requestOption.data,
                queryParameters: requestOption.queryParameters));
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

  @override
  String humanizeNetworkError(Exception exception) {
    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.connectionError:
          return "网络异常";
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return "网络请求超时";
        case DioErrorType.badResponse:
          return "服务器异常";
        case DioErrorType.cancel:
          return "请求取消";
        case DioErrorType.badCertificate:
          return "证书错误";
        case DioErrorType.unknown:
          return "未知错误";
      }
    }
    return "未知错误";
  }
}
