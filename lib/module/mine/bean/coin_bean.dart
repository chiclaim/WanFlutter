class CoinBean {
  int? coinCount;
  int? date;
  String? desc;
  int? id;
  String? reason;
  int? type;
  int? userId;
  String? userName;

  CoinBean(
      {this.coinCount,
      this.date,
      this.desc,
      this.id,
      this.reason,
      this.type,
      this.userId,
      this.userName});

  CoinBean.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    date = json['date'];
    desc = json['desc'];
    id = json['id'];
    reason = json['reason'];
    type = json['type'];
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coinCount'] = coinCount;
    data['date'] = date;
    data['desc'] = desc;
    data['id'] = id;
    data['reason'] = reason;
    data['type'] = type;
    data['userId'] = userId;
    data['userName'] = userName;
    return data;
  }
}
