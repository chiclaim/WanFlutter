import 'package:wanflutter/library/network/method.dart';

class RequestOption {
  /// Http method.
  Method method;

  /// Request base url, it can contain sub path, like: https://dart.dev/api/.
  String? baseUrl;

  /// Http request headers.
  Map<String, dynamic>? headers;

  /// Timeout for opening url.
  Duration? connectTimeout;

  Duration? receiveTimeout;

  /// Request data, can be any type.
  dynamic data;

  /// If the `path` starts with 'http(s)', the `baseURL` will be ignored, otherwise,
  /// it will be combined and then resolved with the baseUrl.
  String path;

  String? contentType;

  /// Common query parameters.
  Map<String, dynamic>? queryParameters;

  /// Custom field that you can retrieve it later in
  /// [Interceptor], [Transformer] and the [Response] object.
  Map<String, dynamic>? extra;

  RequestOption(this.path,
      {this.baseUrl,
      this.method = Method.get,
      this.headers,
      this.connectTimeout,
      this.receiveTimeout,
      this.contentType,
      this.queryParameters,
      this.data,
      this.extra});
}
