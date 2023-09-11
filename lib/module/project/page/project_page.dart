import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/string_utils.dart';
import 'package:wanflutter/module/base/network/response_result.dart';
import 'package:wanflutter/module/project/api/project_api.dart';
import 'package:wanflutter/module/project/bean/project_category_bean.dart';
import 'package:wanflutter/widget/universal_widget.dart';

///
/// “项目”页面
///
class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProjectState();
  }
}

class ProjectState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  final List<ProjectCategoryBean> categoryList = [];
  final List<Tab> projectTabs = [];
  final List<Widget> projectListContentWidgets = [];
  TabController? _tabLayoutController;
  final ProjectApi projectApi = ProjectApi();

  void _requestProjectCategory() async {
    final ResponseResult responseResult =
        await projectApi.requestProjectCategory();
    if (responseResult.ok) {
      List<ProjectCategoryBean>? data = responseResult.data;
      categoryList.clear();
      categoryList.addAll(data ?? []);
      setState(() {
        _tabLayoutController =
            TabController(vsync: this, length: categoryList.length);
        for (var element in categoryList) {
          projectTabs
              .add(Tab(text: StringUtils.unescapeHtml(element.name ?? "")));
          projectListContentWidgets.add(Text(element.name ?? "---"));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _requestProjectCategory();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, hasBack: false),
      body: categoryList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  color: const Color(0xFF3D3D3D),
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabLayoutController,
                    tabs: projectTabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabLayoutController,
                    children: projectListContentWidgets,
                  ),
                ),
              ],
            ),
    );
  }
}
