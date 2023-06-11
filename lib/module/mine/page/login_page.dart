import 'package:flutter/material.dart';
import 'package:wanflutter/widget/universal_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageStatee();
  }
}

class LoginPageStatee extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UniversalWidget.buildAppBar(context, title: "登录"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: '用户名',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
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
                    // 处理登录逻辑
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
}
