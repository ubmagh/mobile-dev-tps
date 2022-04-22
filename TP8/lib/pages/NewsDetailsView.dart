import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/news_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer<NewsDataProvider>(
              builder: (context, state, child) => Text(state.title)),
        ),
        body: Consumer<NewsDataProvider>(
          builder: (context, state, child) => WebView(
            initialUrl: state.url,
          ),
        ));
  }
}
