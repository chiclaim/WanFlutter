///
/// “我的” 页面
///
import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/string_utils.dart';
import 'package:wanflutter/module/common/router/router_config.dart';
import 'package:wanflutter/module/common/router/router_utils.dart';
import 'package:wanflutter/module/common/user/user_manager.dart';
import 'package:wanflutter/module/mine/bean/user_bean.dart';
import 'package:wanflutter/module/mine/bean/user_vo.dart';
import 'package:wanflutter/widget/setting_item_widget.dart';
import 'package:wanflutter/widget/widget_factory.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin
    implements UserEventListener {
  UserVo _user = UserVo();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    UserManager.registerUserEventListener(this);
  }

  @override
  void dispose() {
    super.dispose();
    UserManager.removeUserEventListener(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, title: "我的", hasBack: false),
      body: Column(children: [
        _buildUserWidget(context),
        const SizedBox(height: 30),
        _buildSettingWidget(),
      ]),
    );
  }

  Widget _buildUserWidget(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 登录入口
            GestureDetector(
                onTap: () {
                  if (_user.isLogin()) return;
                  RouterUtils.pushPage(
                    context,
                    Routers.pageLogin.path,
                  );
                },
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 35, top: 20, right: 20, bottom: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          // backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                        const SizedBox(width: 25),
                        Text(
                          StringUtils.isEmpty(_user.getShowName())
                              ? '登录/注册'
                              : _user.getShowName(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
            Row(
              children: [
                Expanded(
                    child: Column(children: [
                  Text(_user.getCollectCount().toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('收藏', style: TextStyle(fontSize: 14))
                ])),
                Expanded(
                    child: Column(children: [
                  Text(_user.getCoinCount().toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('积分', style: TextStyle(fontSize: 14))
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

  @override
  void onLogin(User user) {
    setState(() {
      _user = UserVo(user: user);
    });
  }

  @override
  void onLogout() {}
}
