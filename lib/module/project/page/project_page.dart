import 'package:flutter/cupertino.dart';
import 'package:wanflutter/module/base/base_page.dart';

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
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("项目"),
    );
  }
}
