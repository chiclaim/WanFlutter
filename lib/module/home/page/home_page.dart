import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/toast_utils.dart';
import 'package:wanflutter/module/base/bean/article_bean.dart';
import 'package:wanflutter/module/base/bean/paging_bean.dart';
import 'package:wanflutter/module/base/constants.dart';
import 'package:wanflutter/module/common/router/router_config.dart';
import 'package:wanflutter/module/common/router/router_utils.dart';
import 'package:wanflutter/module/home/api/home_api.dart';
import 'package:wanflutter/module/home/bean/home_banner_bean.dart';

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
  final List<Object> _list = [];
  List<HomeBanner>? _bannerList;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  late HomeApi _homeApi;

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

  fetchBannerList() async {
    final bannerResult = await _homeApi.requestBanner();
    if (!bannerResult.ok) {
      ToastUtils.show(bannerResult.errorMsg ?? "");
      return;
    }
    final List<HomeBanner>? bannerData = bannerResult.data;
    if (bannerData != null && bannerData.isNotEmpty) {
      _bannerList = bannerData;
      _list.insert(0, bannerData);
    }
    // 如果文章列表有数据则刷新
    if (_list.isNotEmpty) {
      setState(() {});
    }
  }

  void fetchHomeArticleList(
      {required int pageIndex, int pageSize = defaultPageSize}) async {
    setState(() {
      _isLoading = true;
    });
    final result =
        await _homeApi.requestArticleList(pageIndex, pageSize: pageSize);
    if (result.ok) {
      if (pageIndex == 0) {
        _list.clear();
      }
      if (_bannerList == null || _bannerList!.isEmpty) {
        fetchBannerList();
      }
      final Paging? paging = result.data;
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
    _homeApi = HomeApi();
    _scrollController.addListener(_scrollListener);
    fetchHomeArticleList(pageIndex: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'WanAndroid',
            style: TextStyle(color: titleColor),
          ),
          backgroundColor: mainColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              tooltip: "搜索",
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFF2F2F2),
              height: 1.0,
            ),
          )),
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
              if (bean is Article) {
                return GestureDetector(
                    onTap: () {
                      if (bean.link == null) return;
                      RouterUtils.pushPage(
                          context, Routers.pageArticleDetail.path,
                          arguments: {"url": bean.link, "title": bean.title});
                    },
                    child: _buildItem(bean));
              } else if (bean is List<HomeBanner>) {
                return buildTopSlider(bean);
              } else {
                return const Text("Unknown data");
              }
            }
          }),
    );
  }

  Widget buildTopSlider(List<HomeBanner> banners) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeFactor: 1.0,
          aspectRatio: 9 / 5,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          viewportFraction: 1.2,
          autoPlayInterval: const Duration(seconds: 5)),
      items: banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(
                banner.imagePath ?? "",
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildTopRow(int index, String? title, String? link) {
    return GestureDetector(
        onTap: () {
          if (link == null) return;
          Navigator.pushNamed(context, "wan-flutter://article_detail_page",
              arguments: {"url": link, "title": title});
        },
        child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      "$index",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          title ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF3D3D3D)),
                        )))
              ],
            )));
  }

  List<Widget> _buildTags(Article article) {
    final tags = [];
    if (article.chapterName?.isNotEmpty == true) {
      tags.add(article.chapterName!);
    }
    tags.addAll(article.tags?.map((e) => e.name).toList() ?? []);
    return tags
        .map((e) => Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFE9E9EB),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, right: 3, bottom: 1.5),
              child: Text(
                e,
                style: const TextStyle(
                  color: Color(0xFF9D9D9F),
                  fontSize: 12.0,
                ),
              ),
            )))
        .toList();
  }

  Widget _buildItem(Article article) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title ?? "",
            style: const TextStyle(fontSize: 18, color: Color(0xFF3D3D3D)),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 作者，时间
                          Container(
                            margin: const EdgeInsets.only(top: 0),
                            child: Row(
                              children: [
                                Text(
                                  article.author?.isNotEmpty == true
                                      ? article.author!
                                      : "佚名",
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF69686E)),
                                ),
                                const Text(
                                  " | ",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFFE9E9EB)),
                                ),
                                Text(
                                  article.niceDate ?? "",
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF9D9D9F)),
                                ),
                              ],
                            ),
                          ),
                          // 标签
                          Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: _buildTags(article),
                              )),
                        ]),
                    // 收藏按钮
                    Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          color: article.collect == true
                              ? Colors.blue[200]
                              : const Color(0xFF9D9D9F).withOpacity(0.5),
                          icon: article.collect == true
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () {
                            // 处理收藏按钮点击事件
                          },
                        ))
                  ]))
        ],
      ),
    );
  }
}
