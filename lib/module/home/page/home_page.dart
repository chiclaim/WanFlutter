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

  dynamic data;

  @override
  void initState() async {
    super.initState();
    // final result = await HomeApi().requestArticleList(0);
    // setState(() {
    //   data = "1221";
    // });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("12121"),
    );
  }
}
