import 'package:flutter/material.dart';

class RandomLottery extends StatefulWidget {
  const RandomLottery({super.key});

  @override
  State<RandomLottery> createState() => _RandomLotteryState();
}

class _RandomLotteryState extends State<RandomLottery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('随机数抽奖')));
  }
}
