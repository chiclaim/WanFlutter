import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/base/base_page.dart';

///
/// “我的” 页面
///
class MinePage extends BaseStatefulPage {
  const MinePage({super.key}) : super(title: "我的");

  @override
  Widget buildBody() {
    return const Text("我的");
  }
}
