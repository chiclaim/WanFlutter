import 'package:flutter/material.dart';
import 'package:wanflutter/module/home/page/home_page.dart';
import 'package:wanflutter/module/mine/page/mine_page.dart';
import 'package:wanflutter/module/project/page/project_page.dart';
import 'package:wanflutter/module/system/page/system_page.dart';

void main() => runApp(const EntryApp());

class EntryApp extends StatefulWidget {
  const EntryApp({super.key});

  @override
  State createState() => _EntryAppState();
}

class _EntryAppState extends State<EntryApp> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final pages = <Widget>[
    const HomePage(),
    const SystemPage(),
    const ProjectPage(),
    const MinePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _selectedIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WanAndroid'),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动
          children: pages,
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
