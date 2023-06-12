class StringUtils {
  static const escapes = {
    "&quot;": '"',
    '&ldquo;': '“',
    '&rdquo;': '”',
    '&amp;': '&',
    '&lt;': '<',
    '&gt;': '>',
    '&nbsp;': ' ',
    '&rarr;': '→',
    '&mdash;': '—',
  };

  /// 当 str 等于 null、空字符串、空格 均返回true
  static bool isEmpty(String? str) {
    return str == null || str.trim().isEmpty;
  }

  /// 当 [str] 不等于 null、空字符串、空格 均返回 true
  static bool isNotEmpty(String? str) {
    return !isEmpty(str);
  }

  static String unescapeHtml(String str) {
    if (isEmpty(str)) return str;
    escapes.forEach((key, value) {
      str = str.replaceAll(key, value);
    });
    return str;
  }
}
