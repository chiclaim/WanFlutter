abstract class BaseUrl {
  const BaseUrl();

  /// base url
  String getBaseUrl();

  /// BaseUrl 对应的键. <p>
  /// 注意：key 用于唯一标识 BaseUrl，不同的 BaseUrl，使用不同的 key.
  String key();
}

class WanBaseUrl implements BaseUrl {
  // 常量对象
  const WanBaseUrl();

  @override
  String getBaseUrl() {
    return "https://www.wanandroid.com";
  }

  @override
  String key() {
    return "wan";
  }
}
