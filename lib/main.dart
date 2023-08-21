import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/page/home_page_landscape.dart';
import 'package:ok/page/home_page_portrait.dart';

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
      home: kIsWeb ||
              defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.windows ||
              defaultTargetPlatform == TargetPlatform.linux
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  changeLayout(context, constraints),
            )
          : LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  changeLayout(context, constraints),
            ),
    );
  }

  Widget changeLayout(BuildContext context, BoxConstraints constraints) {
    double screenWidth = constraints.maxWidth;
    if (MediaQuery.of(context).orientation == Orientation.landscape &&
        MediaQuery.of(context).size.width >
            MediaQuery.of(context).size.height) {
      return HomePageLandscape(); // 横屏或大屏布局
    } else if (screenWidth >= 500) {
      return HomePageLandscape(); // 横屏或大屏布局
    } else {
      return HomePagePortrait(); // 竖屏布局
    }
  }
}
