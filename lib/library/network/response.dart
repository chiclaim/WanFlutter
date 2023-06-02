import 'package:dio/dio.dart';
import 'package:wanflutter/library/network/options.dart';

class ResponseInfo<T> {
  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;

  /// The corresponding request info.
  RequestOption requestOptions;

  /// HTTP status code.
  int? statusCode;

  /// Returns the reason phrase associated with the status code.
  /// The reason phrase must be set before the body is written
  /// to. Setting the reason phrase after writing to the body.
  String? statusMessage;

  /// Whether this response is a redirect.
  /// ** Attention **: Whether this field is available depends on whether the
  /// implementation of the adapter supports it or not.
  bool isRedirect;

  /// Custom fields that are constructed in the [RequestOption].
  Map<String, dynamic> extra;

  /// Response headers.
  Headers headers;

  ResponseInfo({
    this.data,
    required this.requestOptions,
    this.statusCode,
    this.statusMessage,
    this.isRedirect = false,
    this.extra = const {},
    Headers? headers,
  }) : headers = headers ?? Headers();
}
