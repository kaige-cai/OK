import 'package:flutter/material.dart';
import 'package:ok/widget/video_item.dart';

class TikTokPage extends StatefulWidget {
  const TikTokPage({super.key});

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class _TikTokPageState extends State<TikTokPage> {
  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)!.settings.arguments;
    final String playUrl = arguments as String;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return VideoItem(videoUrl: playUrl);
      },
    );
  }
}
