import 'package:wanflutter/module/article/bean/collect_bean.dart';

class PagingCollect {
  int? curPage;
  List<CollectBean>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  PagingCollect({curPage, datas, offset, over, pageCount, size, total});

  PagingCollect.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = <CollectBean>[];
      json['datas'].forEach((v) {
        datas!.add(CollectBean.fromJson(v));
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
