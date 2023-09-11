class ProjectCategoryBean {
  String? author;
  int? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  int? order;
  int? parentChapterId;
  int? type;
  bool? userControlSetTop;
  int? visible;

  ProjectCategoryBean(
      {this.author,
      this.courseId,
      this.cover,
      this.desc,
      this.id,
      this.lisense,
      this.lisenseLink,
      this.name,
      this.order,
      this.parentChapterId,
      this.type,
      this.userControlSetTop,
      this.visible});

  ProjectCategoryBean.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    courseId = json['courseId'];
    cover = json['cover'];
    desc = json['desc'];
    id = json['id'];
    lisense = json['lisense'];
    lisenseLink = json['lisenseLink'];
    name = json['name'];
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    type = json['type'];
    userControlSetTop = json['userControlSetTop'];
    visible = json['visible'];
  }

  static List<ProjectCategoryBean>? fromJsonList(List<dynamic>? data) {
    return data
        ?.map<ProjectCategoryBean>((e) => ProjectCategoryBean.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['courseId'] = courseId;
    data['cover'] = cover;
    data['desc'] = desc;
    data['id'] = id;
    data['lisense'] = lisense;
    data['lisenseLink'] = lisenseLink;
    data['name'] = name;
    data['order'] = order;
    data['parentChapterId'] = parentChapterId;
    data['type'] = type;
    data['userControlSetTop'] = userControlSetTop;
    data['visible'] = visible;
    return data;
  }
}
