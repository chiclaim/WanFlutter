class CollectBean {
  String? author;
  int? chapterId;
  String? chapterName;
  int? courseId;
  String? desc;
  String? envelopePic;
  int? id;
  String? link;
  String? niceDate;
  String? origin;
  int? originId;
  int? publishTime;
  String? title;
  int? userId;
  int? visible;
  int? zan;

  CollectBean(
      {this.author,
      this.chapterId,
      this.chapterName,
      this.courseId,
      this.desc,
      this.envelopePic,
      this.id,
      this.link,
      this.niceDate,
      this.origin,
      this.originId,
      this.publishTime,
      this.title,
      this.userId,
      this.visible,
      this.zan});

  CollectBean.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    courseId = json['courseId'];
    desc = json['desc'];
    envelopePic = json['envelopePic'];
    id = json['id'];
    link = json['link'];
    niceDate = json['niceDate'];
    origin = json['origin'];
    originId = json['originId'];
    publishTime = json['publishTime'];
    title = json['title'];
    userId = json['userId'];
    visible = json['visible'];
    zan = json['zan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['chapterId'] = chapterId;
    data['chapterName'] = chapterName;
    data['courseId'] = courseId;
    data['desc'] = desc;
    data['envelopePic'] = envelopePic;
    data['id'] = id;
    data['link'] = link;
    data['niceDate'] = niceDate;
    data['origin'] = origin;
    data['originId'] = originId;
    data['publishTime'] = publishTime;
    data['title'] = title;
    data['userId'] = userId;
    data['visible'] = visible;
    data['zan'] = zan;
    return data;
  }
}
