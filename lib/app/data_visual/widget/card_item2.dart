import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CardItem2 extends StatelessWidget {
  const CardItem2({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: SizedBox(
        height: double.infinity,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              dataModel.title,
              style: const TextStyle(
                fontSize: 64.0,
                color: Colors.red,
                height: 1.1,
                fontWeight: FontWeight.bold,
                fontFamily: 'DF',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
