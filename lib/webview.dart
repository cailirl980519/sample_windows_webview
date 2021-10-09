import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_windows/webview_windows.dart' as wweb;

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _winController = wweb.WebviewController();

  Future<void> initWindowsWebView() async {
    if (!Platform.isWindows) return;
    await _winController.initialize();
    await _winController.loadUrl(
        "https://developer.microsoft.com/en-us/microsoft-edge/webview2/");
    while (!_winController.value.isInitialized) {
      // wait for init
      sleep(Duration(milliseconds: 200));
    }
    setState(() {}); // reload UI after init
  }

  Widget webView() {
    if (!Platform.isWindows)
      return Center(
        child: Text("not Support"),
      );
    if (!_winController.value.isInitialized)
      return Center(
        child: Lottie.network(
            "https://assets9.lottiefiles.com/datafiles/bEYvzB8QfV3EM9a/data.json"),
      );
    return Container(
      child: wweb.Webview(_winController),
    );
  }

  @override
  void initState() {
    super.initState();
    initWindowsWebView();
  }

  @override
  void dispose() {
    super.dispose();
    _winController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample1"),
      ),
      body: webView(),
    );
  }
}
