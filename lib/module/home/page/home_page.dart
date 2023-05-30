import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/base/base_page.dart';

///
/// 首页
///
class HomePage extends BaseStatefulPage {
  const HomePage({super.key}) : super(title: "首页");

  @override
  Widget buildBody() {
    return const Text("首页");
  }
}
