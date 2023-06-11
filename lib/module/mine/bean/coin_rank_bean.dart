class CoinRankBean {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  CoinRankBean(
      {this.coinCount,
      this.level,
      this.nickname,
      this.rank,
      this.userId,
      this.username});

  CoinRankBean.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    level = json['level'];
    nickname = json['nickname'];
    rank = json['rank'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coinCount'] = coinCount;
    data['level'] = level;
    data['nickname'] = nickname;
    data['rank'] = rank;
    data['userId'] = userId;
    data['username'] = username;
    return data;
  }
}
