// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ok/app/data_visual/widget/card_item3.dart';
import 'package:ok/app/data_visual/widget/card_item7.dart';
import 'package:ok/util/global.dart';

import '../model/data_model.dart';
import '../widget/card_item0.dart';
import '../widget/card_item1.dart';

class DataVisualPage extends StatefulWidget {
  const DataVisualPage({super.key});

  @override
  State<DataVisualPage> createState() => _DataVisualPageState();
}

class _DataVisualPageState extends State<DataVisualPage> with SingleTickerProviderStateMixin {
  List<DataModel> dataModels = [];
  late AnimationController _animController;
  final ScrollController scrollController = ScrollController();
  bool enableScroll = false;

  @override
  void initState() {
    super.initState();
    loadJsonData();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animController.forward();
      Future.delayed(const Duration(seconds: 3), () {
        _startScrollAnimation();
      });
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          enableScroll = true;
        });
      }
    });
  }

  Future<void> loadJsonData() async {
    final String data = await rootBundle.loadString('asset/json/data8_en.json');
    final dynamic jsonResult = json.decode(data);

    if (jsonResult is Map && jsonResult.containsKey("result")) {
      final List<dynamic> results = jsonResult["result"];
      dataModels = results.map((item) => DataModel.fromJson(item)).toList();
    }

    setState(() {});
  }

  Future<void> _startScrollAnimation() async {
    final int itemCount = dataModels.length;
    const int timePerItemInSeconds = 2;
    final int totalScrollDurationInSeconds = itemCount * timePerItemInSeconds;

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: totalScrollDurationInSeconds),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            if (enableScroll) {
              scrollController.position.setPixels(scrollController.position.pixels);
            }
          }
          return false;
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 52.0),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List<Widget>.generate(
                  dataModels.length,
                  (index) {
                    logger.i('总共有${dataModels.length}个对象');
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 1.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(
                        CurvedAnimation(
                          parent: _animController,
                          curve: Interval(index / dataModels.length, (index + 1) / dataModels.length),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: CardItem7(
                          dataModel: dataModels[index],
                        ),
                      ),
                    );
                  },
                ), //..shuffle(Random()),
                ...List.generate(
                  3,
                  (index) => Container(width: MediaQuery.of(context).size.width / 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
