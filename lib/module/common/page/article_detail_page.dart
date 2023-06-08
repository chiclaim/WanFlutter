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
              onPressed: () {},
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
}
