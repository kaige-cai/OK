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
        detailsPage: (context) => CategoryDetailsPage(),
        videoPage: (context) => VideoPage(),
        shortsVideoPage: (context) => ShortsVideoPage(),
        chatGPTPage: (context) => ChatGPTPage(),
        calculatorPage: (context) => CalculatorPage(),
        weatherForecastPage: (context) => WeatherForecastPage(),
        newsPage: (context) => NewsPage(),
        randomLottery: (context) => RandomLottery(),
        wheelSurf: (context) => WheelSurf(),
        cameraPage: (context) => CameraPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
