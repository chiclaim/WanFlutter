import 'package:flutter/material.dart';

class RouterUtils {
  static void pushPage(BuildContext context, String router,
      {Object? arguments}) {
    Navigator.pushNamed(context, router, arguments: arguments);
  }

  static void closePage(BuildContext context) {
    Navigator.pop(context);
  }
}
