import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  final IconData? leftIconData;
  final double iconTextMargin;
  final String text;
  final TextStyle? textStyle;
  final IconData? rightIconData;
  static const double defaultIconSize = 20;

  const SettingItemWidget(
      {super.key,
      this.leftIconData,
      required this.text,
      this.textStyle =
          const TextStyle(fontSize: 16, color: Color(0xFF252933), height: 1.1),
      this.iconTextMargin = 10,
      this.rightIconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leftIconData != null) Icon(leftIconData, size: defaultIconSize),
        SizedBox(width: iconTextMargin), // 添加间距
        Text(text, style: textStyle),
        const Spacer(), // 将箭头图标推到右侧
        if (rightIconData != null) Icon(rightIconData, size: 16),
      ],
    );
  }
}
