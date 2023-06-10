import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  final IconData? leftIconData;
  final double iconTextMargin;
  final String text;
  final TextStyle? textStyle;
  final IconData? rightIconData;
  final GestureTapCallback? onTap;
  static const double defaultIconSize = 22;

  const SettingItemWidget(
      {super.key,
      this.leftIconData,
      required this.text,
      this.textStyle =
          const TextStyle(fontSize: 16, color: Color(0xFF252933), height: 1.1),
      this.iconTextMargin = 10,
      this.rightIconData,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    if (leftIconData != null)
                      Icon(leftIconData,
                          color: Colors.grey, size: defaultIconSize),
                    SizedBox(width: iconTextMargin), // 添加间距
                    Text(text, style: textStyle),
                    const Spacer(), // 将箭头图标推到右侧
                    if (rightIconData != null)
                      Icon(rightIconData, color: Colors.grey, size: 16),
                  ],
                ))));
  }
}
