import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CardItem2 extends StatelessWidget {
  final DataModel dataModel;

  const CardItem2({
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
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: dataModel.pic,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(dataModel.value),
          Text(dataModel.title),
          Text(dataModel.subtitle),
        ],
      ),
    );
  }
}

class DelayedCardItem extends StatefulWidget {
  final DataModel dataModel;
  final Duration delayDuration;

  const DelayedCardItem({
    super.key,
    required this.dataModel,
    required this.delayDuration,
  });

  @override
  DelayedCardItemState createState() => DelayedCardItemState();
}

class DelayedCardItemState extends State<DelayedCardItem> {
  bool _showCard = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delayDuration, () {
      setState(() {
        _showCard = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showCard ? CardItem2(dataModel: widget.dataModel) : Container();
  }
}
