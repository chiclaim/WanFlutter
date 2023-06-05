import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text(title ?? "")),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
