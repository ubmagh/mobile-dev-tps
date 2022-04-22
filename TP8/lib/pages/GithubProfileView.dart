import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp8_apps/providers/github_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubProfileView extends StatelessWidget {
  const GitHubProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer<GithubDataProvider>(
              builder: (context, state, child) =>
                  Text(" Profile of : " + state.username)),
        ),
        body: Consumer<GithubDataProvider>(
          builder: (context, state, child) => WebView(
            initialUrl: state.url,
          ),
        ));
  }
}
