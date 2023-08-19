import 'package:flutter/material.dart';

class OKLottery extends StatefulWidget {
  const OKLottery({super.key});

  @override
  State<OKLottery> createState() => _OKLotteryState();
}

class _OKLotteryState extends State<OKLottery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('彩票')));
  }
}
