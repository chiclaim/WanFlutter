import 'package:flutter/material.dart';
import 'package:wanflutter/module/common/constants.dart';

/// 通用组件
class UniversalWidget {
  static AppBar buildAppBar(BuildContext context,
      {String? title,
      TextStyle titleStyle = const TextStyle(color: titleColor),
      Color? backgroundColor,
      bool hasBack = true,
      Function? backFunction,
      String? backToolTip,
      List<Widget>? actions}) {
    return AppBar(
      leading: hasBack
          ? IconButton(
              color: titleColor,
              tooltip: backToolTip ?? "返回",
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              })
          : null,
      title: title != null
          ? Text(
              title,
              style: const TextStyle(color: titleColor),
            )
          : null,
      centerTitle: true,
      backgroundColor: backgroundColor ?? mainColor,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: const Color(0xFFF2F2F2),
          height: 1.0,
        ),
      ),
      actions: actions,
    );
  }
}
