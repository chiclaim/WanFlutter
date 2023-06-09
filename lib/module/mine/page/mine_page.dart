///
/// “我的” 页面
///
import 'package:flutter/material.dart';
import 'package:wanflutter/widget/setting_item_widget.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.favorite,
                text: '我的收藏',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理我的收藏的点击事件
            },
          ),
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.history,
                text: '历史记录',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理历史记录的点击事件
            },
          ),
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.watch_later,
                text: '稍后再看',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理稍后再看的点击事件
            },
          ),
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.point_of_sale,
                text: '我的积分',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理我的积分的点击事件
            },
          ),
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.extension,
                text: '自定义功能',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理自定义功能的点击事件
            },
          ),
          ListTile(
            title: const SettingItemWidget(
                leftIconData: Icons.logout,
                text: '退出登录',
                rightIconData: Icons.arrow_forward_ios),
            onTap: () {
              // 处理自定义功能的点击事件
            },
          )
        ],
      ),
    );
  }
}
