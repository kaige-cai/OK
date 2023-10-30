import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_model.dart';

class DataVisualApp extends StatefulWidget {
  const DataVisualApp({super.key});

  @override
  State<DataVisualApp> createState() => _DataVisualAppState();
}

class _DataVisualAppState extends State<DataVisualApp> {
  @override
  Widget build(BuildContext context) {
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

class DataVisualPage1 extends StatefulWidget {
  const DataVisualPage1({super.key});

  @override
  State<DataVisualPage1> createState() => _DataVisualPage1State();
}

class _DataVisualPage1State extends State<DataVisualPage1> {
  List<DataModel> jsonData = []; // 现在使用 DataModel 类型的列表

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String data = await rootBundle.loadString('asset/json/data0.json');
    final dynamic jsonResult = json.decode(data);

    if (jsonResult is Map && jsonResult.containsKey("result")) {
      final List<dynamic> results = jsonResult["result"];
      jsonData = results
          .map((item) => DataModel.fromJson(item))
          .toList(); // 使用 DataModel 类来映射数据
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List<Widget>.generate(
              jsonData.length,
              (index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CardItem(dataModel: jsonData[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final DataModel dataModel;

  const CardItem({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // 设置圆角半径
      ),
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network(
              dataModel.pic,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(dataModel.value),
            Text(dataModel.title),
            Text(dataModel.subtitle),
          ],
        ),
      ),
    );
  }
}
