import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Icon(Icons.access_alarm),
          Icon(Icons.baby_changing_station),
          Icon(Icons.cabin),
          Icon(Icons.dangerous),
          Icon(Icons.earbuds),
        ],
      ),
    );
  }
}
