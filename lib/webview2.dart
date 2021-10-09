import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_windows/webview_windows.dart' as wweb;

class WebView2Page extends StatefulWidget {
  const WebView2Page({Key? key}) : super(key: key);

  @override
  _WebView2PageState createState() => _WebView2PageState();
}

class _WebView2PageState extends State<WebView2Page> {
  final _winController = wweb.WebviewController();
  final _textController =
      TextEditingController(text: "Hi! I'm flutter message.");

  Future<void> initWindowsWebView() async {
    if (!Platform.isWindows) return;
    await _winController.initialize();
    String data = await rootBundle.loadString("assets/webpages/index.html");
    await _winController.loadStringContent(data);
    while (!_winController.value.isInitialized) {
      sleep(Duration(milliseconds: 200));
    }
    setState(() {});
    await for (wweb.LoadingState value in _winController.loadingState) {
      if (value.toString() == "LoadingState.navigationCompleted") {
        _winController.webMessage.listen((args) async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Message from Web"),
                content: Text("${args["message"]}"),
              );
            },
          );
        });
      }
    }
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
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample2"),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Send Message to Web"),
                    content: TextField(
                      controller: _textController,
                    ),
                    actions: [
                      TextButton(
                        child: Text("Send"),
                        onPressed: () {
                          Map data = {
                            "message": _textController.text,
                          };
                          print(data);
                          _winController.postWebMessage('${jsonEncode(data)}');
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: webView(),
    );
  }
}
