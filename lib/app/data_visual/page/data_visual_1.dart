import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/data_model.dart';
import '../widget/card_item.dart';

class DataVisualPage1 extends StatefulWidget {
  const DataVisualPage1({super.key});

  @override
  State<DataVisualPage1> createState() => _DataVisualPage1State();
}

class _DataVisualPage1State extends State<DataVisualPage1> with SingleTickerProviderStateMixin {
  List<DataModel> jsonData = []; // 现在使用 DataModel 类型的列表
  ScrollController scrollController = ScrollController();
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    loadJsonData();

    // 创建一个动画控制器
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15), // 调整动画的持续时间
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animController.forward(); // 开始动画
      // 延迟启动滚动动画，等待入场动画完成
      Future.delayed(const Duration(milliseconds: 2200), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 60), // 调整滚动动画的持续时间
          curve: Curves.linear, // 滚动动画的曲线
        );
      });
    });
  }

  Future<void> loadJsonData() async {
    final String data = await rootBundle.loadString('asset/json/data0.json');
    final dynamic jsonResult = json.decode(data);

    if (jsonResult is Map && jsonResult.containsKey("result")) {
      final List<dynamic> results = jsonResult["result"];
      jsonData = results.map((item) => DataModel.fromJson(item)).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List<Widget>.generate(
            jsonData.length,
            (index) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, index < 3 ? 1.0 : 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(CurvedAnimation(
                  parent: _animController,
                  curve: Interval(index / jsonData.length, (index + 1) / jsonData.length),
                )),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    onTap: () {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(seconds: 60), // 调整滚动动画的持续时间
                        curve: Curves.linear, // 滚动动画的曲线
                      );
                    },
                    child: CardItem(dataModel: jsonData[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
