import 'package:flutter/material.dart';

class WheelSurf extends StatefulWidget {
  const WheelSurf({super.key});

  @override
  State<WheelSurf> createState() => _WheelSurfState();
}

class _WheelSurfState extends State<WheelSurf> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('转盘抽奖'),
      ),
    );
  }
}
