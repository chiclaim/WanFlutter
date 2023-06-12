import 'package:flutter/material.dart';
import 'package:wanflutter/module/common/constants.dart';
import 'package:wanflutter/module/common/router/router_config.dart';
import 'package:wanflutter/module/common/router/router_utils.dart';
import 'package:wanflutter/module/common/user/user_manager.dart';
import 'package:wanflutter/module/mine/api/user_api.dart';
import 'package:wanflutter/module/mine/bean/coin_bean.dart';
import 'package:wanflutter/module/mine/bean/paging_coin_bean.dart';
import 'package:wanflutter/widget/universal_widget.dart';

/// 积分记录页面
class CoinRecordPage extends StatefulWidget {
  const CoinRecordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CoinRecordPageState();
  }
}

class _CoinRecordPageState extends State<CoinRecordPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<Object> _list = [];
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
        total != _list.length - 1) {
      fetchCoinRecordList(pageIndex: ++_pageIndex);
    }
  }

  void fetchCoinRecordList(
      {required int pageIndex, int pageSize = defaultPageSize}) async {
    setState(() {
      _isLoading = true;
    });
    final result =
        await _userApi.requestCoinRecord(pageIndex, pageSize: pageSize);
    if (result.ok) {
      if (pageIndex == 0) {
        _list.clear();
      }

      final PagingCoin? paging = result.data;
      if (_list.isEmpty) {
        _list.add(UserManager.user?.coinCount ?? 0);
      }
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
      appBar: UniversalWidget.buildAppBar(context,
          title: "积分记录",
          titleDividerHeight: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.leaderboard,
                color: titleColor,
              ),
              tooltip: "排行榜",
              onPressed: () {
                RouterUtils.pushPage(context, Routers.pageCoinRankList.path);
              },
            ),
          ]),
      body: ListView.separated(
          controller: _scrollController,
          itemCount: _list.length + 1,
          separatorBuilder: (context, index) {
            return Container(
              height: 1,
            );
          },
          itemBuilder: (context, index) {
            // 底部
            if (index == _list.length) {
              // 所有数据加载完毕(-1是因为头部是总分)
              if (index == _list.length &&
                  total != -1 &&
                  total == _list.length - 1) {
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
              if (bean is int) {
                return Container(
                  height: 120,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    bean.toString(),
                    style: const TextStyle(fontSize: 55),
                  )),
                );
              } else if (bean is CoinBean) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bean.reason ?? "日常签到"),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  bean.desc ?? "",
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.blueGrey),
                                )),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "+${bean.coinCount}",
                          style:
                              const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Text("Unknown data");
            }
          }),
    );
  }
}
