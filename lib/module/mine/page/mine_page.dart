///
/// “我的” 页面
///
import 'package:flutter/material.dart';
import 'package:wanflutter/module/base/constants.dart';
import 'package:wanflutter/widget/setting_item_widget.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
            '我的',
            style: TextStyle(color: titleColor),
          )),
          backgroundColor: mainColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFF2F2F2),
              height: 1.0,
            ),
          )),
      body: Column(children: [
        _buildUserWidget(),
        const SizedBox(height: 30),
        _buildSettingWidget(),
      ]),
    );
  }

  Widget _buildUserWidget() {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 登录入口
            Container(
                padding: const EdgeInsets.only(
                    left: 35, top: 20, right: 20, bottom: 20),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      // backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    SizedBox(width: 25),
                    Text(
                      '登录/注册',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Row(
              children: [
                Expanded(
                    child: Column(children: const [
                  Text("0",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('收藏', style: TextStyle(fontSize: 14))
                ])),
                Expanded(
                    child: Column(children: const [
                  Text("0",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('积分', style: TextStyle(fontSize: 14))
                ])),
                Expanded(
                    child: Column(children: const [
                  Text("0",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('分享', style: TextStyle(fontSize: 14))
                ])),
              ],
            ),
            const SizedBox(height: 20)
          ],
        ));
  }

  Widget _buildSettingWidget() {
    return Column(
      children: [
        SettingItemWidget(
          leftIconData: Icons.favorite,
          text: '我的收藏',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        SettingItemWidget(
          leftIconData: Icons.history,
          text: '历史记录',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        SettingItemWidget(
          leftIconData: Icons.watch_later,
          text: '稍后再看',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        SettingItemWidget(
          leftIconData: Icons.point_of_sale,
          text: '我的积分',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        SettingItemWidget(
          leftIconData: Icons.extension,
          text: '自定义功能',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
        SettingItemWidget(
          leftIconData: Icons.logout,
          text: '退出登录',
          rightIconData: Icons.arrow_forward_ios,
          onTap: () {},
        ),
      ],
    );
  }
}
