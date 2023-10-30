import 'package:flutter/material.dart';

import '../model/data_model.dart';

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
