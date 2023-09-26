import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Quillpallink extends StatefulWidget {
  @override
  _QuillpallinkState createState() => _QuillpallinkState();
}

class _QuillpallinkState extends State<Quillpallink> {
  final GlobalKey webViewKey = GlobalKey();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    initialization();
    simulateLoading();
  }

  void simulateLoading() async {
    await Future.delayed(
        Duration(seconds: 5)); // Simulating a 2-second loading time
    setState(() {
      isLoading = false;
    });
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      InAppWebView(
                          key: webViewKey,
                          initialUrlRequest: URLRequest(
                              url: Uri.parse("https://app.quillpal.com/login")),
                          initialOptions: InAppWebViewGroupOptions(
                              crossPlatform: InAppWebViewOptions(
                            userAgent: 'random',
                          ))),
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
