import 'package:wanflutter/module/mine/bean/user_bean.dart';

class UserVo {
  final User? user;
  UserVo({this.user});

  bool isLogin() {
    return user != null;
  }

  int getCollectCount() {
    final count = user?.collectIds?.length;
    if (count == null) return 0;
    return count;
  }

  int getCoinCount() {
    final count = user?.coinCount;
    if (count == null) return 0;
    return count;
  }

  String getShowName() {
    final name = user?.username;
    if (name == null) return "";
    return name;
  }
}
