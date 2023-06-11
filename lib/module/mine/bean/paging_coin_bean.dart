import 'package:wanflutter/module/mine/bean/coin_bean.dart';

class PagingCoin {
  int? curPage;
  List<CoinBean>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  PagingCoin({curPage, datas, offset, over, pageCount, size, total});

  PagingCoin.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = <CoinBean>[];
      json['datas'].forEach((v) {
        datas!.add(CoinBean.fromJson(v));
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
