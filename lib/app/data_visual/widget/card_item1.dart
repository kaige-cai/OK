import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CardItem1 extends StatelessWidget {
  final DataModel dataModel;

  const CardItem1({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0.0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: dataModel.pic,
              height: 640.0,
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            color: Colors.green,
            child: Center(
              child: Text(
                dataModel.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: dataModel.title.length < 10 ? 55.0 : 38.0,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              height: 202.0,
              color: Colors.red,
              child: Column(
                children: [
                  Text(
                    dataModel.value,
                    style: const TextStyle(color: Colors.white, fontSize: 70.0, height: 1.1),
                  ),
                  Text(
                    dataModel.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 38.0, height: 0.8),
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    dataModel.desc,
                    style: const TextStyle(color: Colors.white, fontSize: 46.0, height: 1.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
