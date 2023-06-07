import 'package:wanflutter/module/home/bean/home_banner_bean.dart';
import 'package:wanflutter/module/home/bean/top_bean.dart';

class HomeTopBean {
  List<Top>? tops;
  List<Banner>? banners;

  HomeTopBean({this.tops, this.banners});

  HomeTopBean.fromJson(List<dynamic>? topData, List<dynamic>? bannerData) {
    tops = topData?.map((e) => Top.fromJson(e)).toList();
    banners = bannerData?.map((e) => Banner.fromJson(e)).toList();
  }
}
