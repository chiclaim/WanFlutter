import 'package:flutter/material.dart';

void main() => runApp(const EntryApp());

class EntryApp extends StatefulWidget {
  const EntryApp({super.key});

  @override
  State createState() => _EntryAppState();
}

class _EntryAppState extends State<EntryApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WanFlutter'),
        ),
        body: const Center(
          child: Text('Content'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 固定每个选项的宽度和位置
          // selectedFontSize: 14,
          showSelectedLabels: true, // 显示选中项的文本标签
          showUnselectedLabels: true, // 显示未选中项的文本标签
          backgroundColor: Colors.white, // 设置底部导航栏的背景色
          selectedItemColor: Colors.blue, // 设置选中项的颜色
          unselectedItemColor: Colors.grey, // 设置未选中项的颜色
          elevation: 8, // 设置底部导航栏的阴影效果
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_module),
              label: '体系',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: '项目',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
