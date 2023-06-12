import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/string_utils.dart';
import 'package:wanflutter/module/article/api/article_api.dart';
import 'package:wanflutter/module/article/bean/collect_bean.dart';
import 'package:wanflutter/module/article/bean/paging_collect_bean.dart';
import 'package:wanflutter/module/common/router/router_config.dart';
import 'package:wanflutter/module/common/router/router_utils.dart';
import 'package:wanflutter/widget/universal_widget.dart';

// 我的收藏页面
class CollectListPage extends StatefulWidget {
  const CollectListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CollectListPageState();
  }
}

class _CollectListPageState extends State<CollectListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<CollectBean> _list = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  late ArticleApi _articleApi;

  /// 页码从0开始
  int _pageIndex = 0;

  /// 总记录数
  int total = -1;

  /// 每页加载条数[1-40]
  static const int defaultPageSize = 30;

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading &&
        total != _list.length) {
      fetchHomeArticleList(pageIndex: ++_pageIndex);
    }
  }

  void fetchHomeArticleList(
      {required int pageIndex, int pageSize = defaultPageSize}) async {
    setState(() {
      _isLoading = true;
    });
    final result =
        await _articleApi.requestCollectList(pageIndex, pageSize: pageSize);
    if (result.ok) {
      if (pageIndex == 0) {
        _list.clear();
      }
      final PagingCollect? paging = result.data;
      total = paging?.total ?? -1;
      final dataList = paging?.datas;
      if (dataList != null) _list.addAll(dataList);
    } else {
      // 请求失败
      _pageIndex--;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _articleApi = ArticleApi();
    _scrollController.addListener(_scrollListener);
    fetchHomeArticleList(pageIndex: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, title: "我的收藏"),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: _list.length + 1,
          itemBuilder: (context, index) {
            // 底部
            if (index == _list.length) {
              // 所有数据加载完毕
              if (index == _list.length && total == _list.length) {
                return const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '~我是有底线的~',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            } else {
              final bean = _list.elementAt(index);
              return GestureDetector(
                  onTap: () {
                    if (bean.link == null) return;
                    RouterUtils.pushPage(
                        context, Routers.pageArticleDetail.path,
                        arguments: {"url": bean.link, "title": bean.title});
                  },
                  child: _buildItem(bean));
            }
          }),
    );
  }

  Widget _buildItem(CollectBean article) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Text(
            StringUtils.unescapeHtml(article.title ?? ""),
            style: const TextStyle(fontSize: 18, color: Color(0xFF3D3D3D)),
          ),
          // 作者和时间
          Row(
            children: [
              Text(
                article.author?.isNotEmpty == true ? article.author! : "佚名",
                style: const TextStyle(fontSize: 14, color: Color(0xFF69686E)),
              ),
              const Text(
                " | ",
                style: TextStyle(fontSize: 14, color: Color(0xFFE9E9EB)),
              ),
              Text(
                article.niceDate ?? "",
                style: const TextStyle(fontSize: 14, color: Color(0xFF9D9D9F)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
