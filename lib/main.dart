import 'package:flutter/material.dart';
import 'package:sample_webview_windows/home.dart';
import 'package:sample_webview_windows/theme.dart';
import 'package:sample_webview_windows/webview.dart';
import 'package:sample_webview_windows/webview2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myThemeData(context),
      home: const HomePage(),
      routes: {
        "/webview": (_) => WebViewPage(),
        "/webview2": (_) => WebView2Page(),
      },
    );
  }
}
