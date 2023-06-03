import 'package:wanflutter/module/base/bean/tag_bean.dart';

class Article {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<Tag>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  Article(
      {adminAdd,
      apkLink,
      audit,
      author,
      canEdit,
      chapterId,
      chapterName,
      collect,
      courseId,
      desc,
      descMd,
      envelopePic,
      fresh,
      host,
      id,
      isAdminAdd,
      link,
      niceDate,
      niceShareDate,
      origin,
      prefix,
      projectLink,
      publishTime,
      realSuperChapterId,
      selfVisible,
      shareDate,
      shareUser,
      superChapterId,
      superChapterName,
      tags,
      title,
      type,
      userId,
      visible,
      zan});

  Article.fromJson(Map<String, dynamic> json) {
    adminAdd = json['adminAdd'];
    apkLink = json['apkLink'];
    audit = json['audit'];
    author = json['author'];
    canEdit = json['canEdit'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    courseId = json['courseId'];
    desc = json['desc'];
    descMd = json['descMd'];
    envelopePic = json['envelopePic'];
    fresh = json['fresh'];
    host = json['host'];
    id = json['id'];
    isAdminAdd = json['isAdminAdd'];
    link = json['link'];
    niceDate = json['niceDate'];
    niceShareDate = json['niceShareDate'];
    origin = json['origin'];
    prefix = json['prefix'];
    projectLink = json['projectLink'];
    publishTime = json['publishTime'];
    realSuperChapterId = json['realSuperChapterId'];
    selfVisible = json['selfVisible'];
    shareDate = json['shareDate'];
    shareUser = json['shareUser'];
    superChapterId = json['superChapterId'];
    superChapterName = json['superChapterName'];
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(Tag.fromJson(v));
      });
    }
    title = json['title'];
    type = json['type'];
    userId = json['userId'];
    visible = json['visible'];
    zan = json['zan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adminAdd'] = adminAdd;
    data['apkLink'] = apkLink;
    data['audit'] = audit;
    data['author'] = author;
    data['canEdit'] = canEdit;
    data['chapterId'] = chapterId;
    data['chapterName'] = chapterName;
    data['collect'] = collect;
    data['courseId'] = courseId;
    data['desc'] = desc;
    data['descMd'] = descMd;
    data['envelopePic'] = envelopePic;
    data['fresh'] = fresh;
    data['host'] = host;
    data['id'] = id;
    data['isAdminAdd'] = isAdminAdd;
    data['link'] = link;
    data['niceDate'] = niceDate;
    data['niceShareDate'] = niceShareDate;
    data['origin'] = origin;
    data['prefix'] = prefix;
    data['projectLink'] = projectLink;
    data['publishTime'] = publishTime;
    data['realSuperChapterId'] = realSuperChapterId;
    data['selfVisible'] = selfVisible;
    data['shareDate'] = shareDate;
    data['shareUser'] = shareUser;
    data['superChapterId'] = superChapterId;
    data['superChapterName'] = superChapterName;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['type'] = type;
    data['userId'] = userId;
    data['visible'] = visible;
    data['zan'] = zan;
    return data;
  }
}
