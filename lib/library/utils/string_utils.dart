class StringUtils {
  /// 当 str 等于 null、空字符串、空格 均返回true
  static bool isEmpty(String? str) {
    return str == null || str.trim().isEmpty;
  }

  /// 当 [str] 不等于 null、空字符串、空格 均返回 true
  static bool isNotEmpty(String? str) {
    return !isEmpty(str);
  }
}
