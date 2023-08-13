import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/app/chat_gpt/main.dart';
import 'package:ok/app/video/video_page.dart';
import 'package:ok/page/demo/list_wheel.dart';

import 'page/home_page.dart';

void main() => runApp(FunApp());

class FunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return CupertinoApp(
      routes: <String, WidgetBuilder>{
        '/list_wheel': (context) => ListWheelPage(),
        '/chat_page': (context) => ChatGPTPage(),
        '/video_page': (context) => VideoPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
