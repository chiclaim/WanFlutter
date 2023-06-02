import 'package:flutter/cupertino.dart';

///
/// “体系”页面
///
class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SystemState();
  }
}

class SystemState extends State<SystemPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("体系"),
    );
  }
}
