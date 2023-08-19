import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/page/home_page.dart';

import 'data/app_routes.dart';

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

    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        details_page: (context) => CategoryDetailsPage(),
        calculator_page: (context) => CalculatorPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
