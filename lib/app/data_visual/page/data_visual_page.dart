import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/data_model.dart';
import '../widget/card_item0.dart';

class DataVisualPage extends StatefulWidget {
  const DataVisualPage({super.key});

  @override
  State<DataVisualPage> createState() => _DataVisualPageState();
}

class _DataVisualPageState extends State<DataVisualPage> with SingleTickerProviderStateMixin {
  List<DataModel> jsonData = [];
  late AnimationController _animController;
  final ScrollController scrollController = ScrollController();
  bool enableScroll = false;

  @override
  void initState() {
    super.initState();
    loadJsonData();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animController.forward();
      Future.delayed(const Duration(milliseconds: 3600), () {
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
    final String data = await rootBundle.loadString('asset/json/data0.json');
    final dynamic jsonResult = json.decode(data);

    if (jsonResult is Map && jsonResult.containsKey("result")) {
      final List<dynamic> results = jsonResult["result"];
      jsonData = results.map((item) => DataModel.fromJson(item)).toList();
    }

    setState(() {});
  }

  void _startScrollAnimation() {
    final int itemCount = jsonData.length;
    const int timePerItemInSeconds = 6;
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
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
          margin: const EdgeInsets.symmetric(horizontal: 86.0),
          child: SingleChildScrollView(
            controller: scrollController,
            /* physics:
                enableScroll ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
            */
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                jsonData.length,
                (index) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, index < 4 ? 1.0 : 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(CurvedAnimation(
                      parent: _animController,
                      curve: Interval(index / jsonData.length, (index + 1) / jsonData.length),
                    )),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: index < 4
                          ? DelayedCardItem(
                              dataModel: jsonData[index],
                              delayDuration: Duration(seconds: index),
                            )
                          : CardItem0(dataModel: jsonData[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
