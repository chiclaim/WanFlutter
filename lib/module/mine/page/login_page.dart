import 'package:flutter/material.dart';
import 'package:wanflutter/library/utils/string_utils.dart';
import 'package:wanflutter/library/utils/toast_utils.dart';
import 'package:wanflutter/module/common/router/router_utils.dart';
import 'package:wanflutter/module/common/user/user_manager.dart';
import 'package:wanflutter/module/mine/api/user_api.dart';
import 'package:wanflutter/module/mine/bean/user_bean.dart';
import 'package:wanflutter/widget/universal_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageStatee();
  }
}

class LoginPageStatee extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "yuzhiqiang400@163.com";
    _passwordController.text = "qiangni123456";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, title: "登录"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: '用户名',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: '密码',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
            ),
            const SizedBox(height: 30.0),
            SizedBox(
                width: double.infinity, // 宽度设为屏幕宽度
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    requestLogin(context);
                  },
                  child: const Text('登录'),
                )),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                // 处理注册逻辑
              },
              child: const Text('注册'),
            ),
          ],
        ),
      ),
    );
  }

  void requestLogin(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (StringUtils.isEmpty(username)) {
      ToastUtils.show("用户名不能为空");
      return;
    }
    if (StringUtils.isEmpty(password)) {
      ToastUtils.show("用户名不能为空");
      return;
    }
    final responseResult = await UserApi().login(username, password);
    final User? user = responseResult.data;
    if (user == null) {
      ToastUtils.show("登录失败");
    } else {
      ToastUtils.show("登录成功");
      UserManager.notifyOnChange(UserEvent.login, data: user);
      setState(() {
        RouterUtils.closePage(context);
      });
    }
  }
}
