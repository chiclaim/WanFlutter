class ResponseResult<T> {
  /// 业务请求是否成功
  final bool ok;

  /// 业务错误编码
  final String? errorCode;

  /// 错误信息（网络错误，业务错误信息）
  final String? errorMsg;

  /// 业务数据
  T? data;

  ResponseResult({required this.ok, this.errorCode, this.errorMsg, this.data});

  factory ResponseResult.copy(ResponseResult source) {
    return ResponseResult<T>(
        ok: source.ok,
        errorCode: source.errorCode,
        errorMsg: source.errorMsg,
        data: source.data);
  }
}
