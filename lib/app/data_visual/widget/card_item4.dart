import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/app/data_visual/model/data_model.dart';
import 'package:ok/app/data_visual/widget/shape.dart';

class CardItem4 extends StatelessWidget {
  const CardItem4({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 18.0),
          Hexagon(value: dataModel.value),
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            height: 80.0,
            alignment: Alignment.center,
            color: Colors.green,
            child: Text(
              dataModel.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 68.0,
                fontFamily: 'KT',
                height: 1.3,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4.0),
            width: double.maxFinite,
            height: 100.0,
            child: Text(
              dataModel.desc,
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: 'KT',
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: CachedNetworkImage(imageUrl: dataModel.pic),
          ),
        ],
      ),
    );
  }
}
