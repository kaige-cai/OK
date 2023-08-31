import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/page/home_page_landscape.dart';
import 'package:ok/page/home_page_portrait.dart';

import 'data/app_routes.dart';

void main() => runApp(const FunApp());

class FunApp extends StatelessWidget {
  const FunApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        detailsPage: (context) => const CategoryDetailsPage(),
        videoPage: (context) => const VideoPage(),
        shortsVideoPage: (context) => const ShortsVideoPage(),
        chatGPTPage: (context) => const ChatGPTPage(),
        calculatorPage: (context) => const CalculatorPage(),
        weatherForecastPage: (context) => const WeatherForecastPage(),
        newsPage: (context) => const NewsPage(),
        randomLottery: (context) => const RandomLottery(),
        wheelSurf: (context) => const WheelSurf(),
        cameraPage: (context) => const CameraPage(),
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
      return const HomePageLandscape(); // 横屏或大屏布局
    } else if (screenWidth >= 500) {
      return const HomePageLandscape(); // 横屏或大屏布局
    } else {
      return const HomePagePortrait(); // 竖屏布局
    }
  }
}
