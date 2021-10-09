import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_webview_windows/theme.dart';
import 'package:path/path.dart' as p;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WebView Sample for Windows",
              style: myTheme.headline1,
            ),
            Container(
              child: Lottie.network(
                "https://assets2.lottiefiles.com/private_files/lf30_blux24sl.json",
              ),
            ),
            Wrap(
              spacing: 20,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: myTheme.primaryColor,
                  ),
                  child: Text("check out sample"),
                  onPressed: () => Navigator.of(context).pushNamed("/webview"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: myTheme.secondaryColor,
                  ),
                  child: Text("check out sample2"),
                  onPressed: () => Navigator.of(context).pushNamed("/webview2"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
