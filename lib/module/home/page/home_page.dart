import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/base/bean/article_bean.dart';
import 'package:wanflutter/module/base/bean/paging_bean.dart';
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
  final List<Article> _list = [];

  void fetchHomeArticleList() async {
    final result = await HomeApi().requestArticleList(0);
    if (result.ok) {
      _list.clear();
      final datas = Paging.fromJson(result.data).datas;
      if (datas != null) _list.addAll(datas);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchHomeArticleList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Text(_list[index].title ?? "");
        });
  }
}
