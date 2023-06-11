import 'package:wanflutter/module/mine/bean/user_bean.dart';

enum UserEvent { login, logout }

abstract class UserEventListener {
  void onLogin(User user);
  void onLogout();
}

class UserManager {
  static final List<UserEventListener> _listeners = [];

  static User? user;

  static bool isLogin() {
    return user != null;
  }

  static void registerUserEventListener(UserEventListener listener) {
    _listeners.add(listener);
  }

  static void removeUserEventListener(UserEventListener listener) {
    _listeners.remove(listener);
  }

  static void notifyOnChange(UserEvent event, {User? data}) {
    for (final element in _listeners) {
      switch (event) {
        case UserEvent.login:
          user = data;
          element.onLogin(data!);
          break;
        case UserEvent.logout:
          user = null;
          element.onLogout();
          break;
      }
    }
  }
}
