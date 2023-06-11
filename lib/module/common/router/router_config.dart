import 'package:flutter/material.dart';
import 'package:wanflutter/main.dart';
import 'package:wanflutter/module/article/page/article_detail_page.dart';
import 'package:wanflutter/module/mine/page/collect_list_page.dart';
import 'package:wanflutter/module/mine/page/login_page.dart';

class Router {
  final String path;
  final WidgetBuilder page;
  const Router(this.path, this.page);
}

class Routers {
  static final pageEntry = Router("/", (context) => const MainPage());
  static final pageLogin =
      Router("wan-flutter://login_page", (context) => const LoginPage());
  static final pageArticleDetail = Router("wan-flutter://article_detail_page",
      (context) => const ArticleDetailPage());
  static final pageCollectList = Router(
      "wan-flutter://collect_list_page", (context) => const CollectListPage());

  static final Map<String, WidgetBuilder> routers = {
    pageEntry.path: pageEntry.page,
    pageArticleDetail.path: pageArticleDetail.page,
    pageLogin.path: pageLogin.page,
    pageCollectList.path: pageCollectList.page
  };
}
