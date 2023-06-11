import 'package:wanflutter/module/mine/bean/coin_rank_bean.dart';

class PagingCoinRank {
  int? curPage;
  List<CoinRankBean>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  PagingCoinRank({curPage, datas, offset, over, pageCount, size, total});

  PagingCoinRank.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = <CoinRankBean>[];
      json['datas'].forEach((v) {
        datas!.add(CoinRankBean.fromJson(v));
      });
    }
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['curPage'] = curPage;
    if (datas != null) {
      data['datas'] = datas!.map((v) => v.toJson()).toList();
    }
    data['offset'] = offset;
    data['over'] = over;
    data['pageCount'] = pageCount;
    data['size'] = size;
    data['total'] = total;
    return data;
  }
  
}
