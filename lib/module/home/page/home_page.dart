import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/home/api/home_api.dart';

///
/// 首页
///
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    HomeApi().requestArticleList(0);

    return const Center(
      child: Text("首页"),
    );
  }
}
