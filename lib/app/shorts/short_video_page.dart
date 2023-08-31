import 'package:flutter/material.dart';

class ShortsVideoPage extends StatefulWidget {
  const ShortsVideoPage({super.key});

  @override
  State<ShortsVideoPage> createState() => _ShortsVideoPageState();
}

class _ShortsVideoPageState extends State<ShortsVideoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('短视频')));
  }
}
