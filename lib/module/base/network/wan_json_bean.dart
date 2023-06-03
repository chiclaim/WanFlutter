class WanJsonBean<T> {
  /// 0 表示成功
  final int errorCode;

  /// 失败 msg
  final String? errorMsg;

  /// 成功返回的业务数据
  final T? data;

  WanJsonBean(
      {required this.errorCode, required this.errorMsg, required this.data});
}
