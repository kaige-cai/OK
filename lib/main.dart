import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/page/home_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
