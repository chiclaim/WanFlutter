import 'package:wanflutter/library/network/response.dart';

class ResponseResult {
  final bool ok;
  final String? msg;
  final ResponseInfo? responseInfo;

  ResponseResult({required this.ok, this.msg, this.responseInfo});
}
