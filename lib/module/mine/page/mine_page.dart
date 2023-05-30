import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/base/base_page.dart';

///
/// “我的” 页面
///
class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MineState();
  }
}

class MineState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("首页"),
    );
  }
}
