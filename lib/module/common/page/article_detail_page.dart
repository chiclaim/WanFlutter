import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanflutter/module/base/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ArticleDetailPageState();
  }
}

class ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final url = arguments['url'];
    final title = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: titleColor,
            tooltip: "返回",
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: mainColor,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: titleColor,
            ),
            tooltip: "更多",
            onPressed: () {
              showBottomSheet();
            },
          ),
        ],
      ),
      body: WebView(
        javascriptMode: url.contains("weixin")
            ? JavascriptMode.unrestricted
            : JavascriptMode.disabled,
        initialUrl: url,
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('分享'),
              onTap: () {
                // 处理分享逻辑
                Navigator.pop(context); // 关闭底部弹窗
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('收藏'),
              onTap: () {
                // 处理收藏逻辑
                Navigator.pop(context); // 关闭底部弹窗
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('复制链接'),
              onTap: () {
                // 处理复制链接逻辑
                Navigator.pop(context); // 关闭底部弹窗
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_browser),
              title: const Text('浏览器打开'),
              onTap: () {
                // 处理浏览器打开逻辑
                Navigator.pop(context); // 关闭底部弹窗
              },
            ),
          ],
        );
      },
    );
  }
}
