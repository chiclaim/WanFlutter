import 'package:wanflutter/library/network/method.dart';
import 'package:wanflutter/library/network/options.dart';
import 'package:wanflutter/module/base/network/http_client.dart';
import 'package:wanflutter/module/base/network/response_result.dart';
import 'package:wanflutter/module/project/bean/project_category_bean.dart';

class ProjectApi {
  // 项目的分类列表
  Future<ResponseResult<List<ProjectCategoryBean>>>
      requestProjectCategory() async {
    return await HttpClient.request(
      RequestOption(
        "/project/tree/json",
        method: Method.get,
      ),
      parseData: (data) => data
          ?.map<ProjectCategoryBean>((e) => ProjectCategoryBean.fromJson(e))
          .toList(),
    );
  }
}
