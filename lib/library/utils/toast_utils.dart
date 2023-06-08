import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// toast 封装类
class ToastUtils {
  static void show(
      {required String msg,
      Toast? toastLength = Toast.LENGTH_SHORT,
      int timeInSecForIosWeb = 1,
      double? fontSize,
      ToastGravity? gravity,
      Color? backgroundColor,
      Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}
