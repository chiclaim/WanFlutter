import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/string_utils.dart';
import 'package:wanflutter/module/mine/api/user_api.dart';
import 'package:wanflutter/module/mine/bean/coin_rank_bean.dart';
import 'package:wanflutter/module/mine/bean/paging_coin_rank_bean.dart';
import 'package:wanflutter/widget/universal_widget.dart';

/// 积分排行榜页面
class CoinRankPage extends StatefulWidget {
  const CoinRankPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CoinRankPageState();
  }
}

class _CoinRankPageState extends State<CoinRankPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<CoinRankBean> _list = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  late UserApi _userApi;

  /// 页码从1开始
  int _pageIndex = 1;

  /// 总记录数
  int total = -1;

  /// 每页加载条数[1-40]
  static const int defaultPageSize = 30;

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading &&
        total != _list.length) {
      fetchCoinRecordList(pageIndex: ++_pageIndex);
    }
  }

  void fetchCoinRecordList(
      {required int pageIndex, int pageSize = defaultPageSize}) async {
    setState(() {
      _isLoading = true;
    });
    final result =
        await _userApi.requestCoinRank(pageIndex, pageSize: pageSize);
    if (result.ok) {
      if (pageIndex == 0) {
        _list.clear();
      }
      final PagingCoinRank? paging = result.data;
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
    _userApi = UserApi();
    _scrollController.addListener(_scrollListener);
    fetchCoinRecordList(pageIndex: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, title: "积分排行榜"),
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
              String? name = bean.nickname;
              if (StringUtils.isEmpty(name)) {
                name = bean.username;
              }
              return Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Text("$name ${bean.coinCount}"));
            }
          }),
    );
  }
}
