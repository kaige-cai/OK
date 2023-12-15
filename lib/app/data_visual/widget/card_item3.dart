import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CardItem3 extends StatelessWidget {
  const CardItem3({super.key, required this.dataModel});

  final DataModel dataModel;

  double scaleTitleSize(String name) {
    switch (name) {
      case '小鸭(duck)子':
        return 60.0;
      default:
        return 64.0;
    }
  }

  double scaleSubtitleSize(String name) {
    switch (name) {
      case '小黑(dark)子':
        return 60.0;
      case '背带裤爱好打篮球':
        return 52.0;
      default:
        return 64.0;
    }
  }

  double margin(String name) {
    switch (name) {
      case '小鸭(duck)子':
        return 200.0;
      case '艾蒿馍馍':
        return 205.0;
      default:
        return 190.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 180.0),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: dataModel.pic,
                ),
              ),
            ),
            Positioned(
              bottom: margin(dataModel.title),
              left: 12.0,
              right: 12.0,
              child: Column(
                children: [
                  Text(
                    dataModel.title,
                    style: TextStyle(
                      fontSize: scaleTitleSize(dataModel.title),
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DF',
                    ),
                    softWrap: true,
                  ),
                  Text(
                    dataModel.subtitle,
                    style: TextStyle(
                      fontSize: scaleSubtitleSize(dataModel.subtitle),
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DF',
                      height: 1.1,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
