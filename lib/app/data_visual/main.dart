import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/data_visual_1.dart';

class DataVisualApp extends StatefulWidget {
  const DataVisualApp({super.key});

  @override
  State<DataVisualApp> createState() => _DataVisualAppState();
}

class _DataVisualAppState extends State<DataVisualApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/route1': (context) => const DataVisualPage1(),
      },
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.8,
            crossAxisCount: 6,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed('/route1');
                    break;
                  default:
                    break;
                }
              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(), // 显示数字
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 9, // 总的单元格数量
        ),
      ),
    );
  }
}
