import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/video_data.dart';
import 'video_item.dart';

class WaterfallFlowView extends StatefulWidget {
  const WaterfallFlowView({super.key});

  @override
  State<WaterfallFlowView> createState() => _WaterfallFlowViewState();
}

class _WaterfallFlowViewState extends State<WaterfallFlowView>
    with AutomaticKeepAliveClientMixin {
  List<Widget> shuffledItems = [];

  List<String> videoUrls = [];

  final List<String> imageUrls = [
    'https://windows10spotlight.com/wp-content/uploads/2023/09/0d5018e494c388988349f345050d4d54.jpg',
    'https://windows10spotlight.com/wp-content/uploads/2023/08/203ea8c98a1c1bf13cc170319a8671fd.jpg',
    'https://windows10spotlight.com/wp-content/uploads/2023/09/0da971bd4f59fa961fbb3213960431ee.jpg',
    'https://windows10spotlight.com/wp-content/uploads/2023/09/785a77faae217e6dc3dbd3e1bdecbd67.jpg',
    'https://windows10spotlight.com/wp-content/uploads/2023/09/358c19bc0fdf491cac6e9e893fc73b8b.jpg',
    'https://windows10spotlight.com/wp-content/uploads/2023/09/25c9740e7a7c61ac65bd90f53a0b248c.jpg',
  ];

  void _shuffleItems() {
    final List<Widget> items = [];

    final List<String> shuffledVideoUrls = List<String>.from(videoUrls)
      ..shuffle();
    final List<String> shuffledImageUrls = List<String>.from(imageUrls)
      ..shuffle();

    int videoIndex = 0;
    int imageIndex = 0;

    for (int i = 0; i < videoUrls.length + imageUrls.length; i++) {
      if (Random().nextBool() && videoIndex < shuffledVideoUrls.length) {
        // 随机展示视频链接
        items.add(VideoItem(videoUrl: shuffledVideoUrls[videoIndex]));
        videoIndex++;
      } else if (imageIndex < shuffledImageUrls.length) {
        // 随机展示图片链接
        items.add(CachedNetworkImage(
          fit: BoxFit.cover,
          height: Random().nextInt(200) + 200,
          imageUrl: shuffledImageUrls[imageIndex],
        ));
        imageIndex++;
      }
    }

    setState(() {
      shuffledItems = items;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchVideoData().then((_) {
      _shuffleItems();
    });
  }

  Future<VideoData> _fetchVideoData() async {
    final Dio dio = Dio();
    try {
      final Response response =
          await dio.get('http://192.168.0.7:8080/tiktok-urls');
      if (response.statusCode == 200) {
        VideoData videoData = VideoData.fromJson(response.data);
        setState(() {
          videoUrls = videoData.douYinUrls;
        });
        return videoData;
      } else {
        throw Exception('加载视频数据失败');
      }
    } catch (e) {
      throw Exception('网络异常：$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: shuffledItems.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        itemBuilder: (BuildContext context, int index) {
          return shuffledItems[index];
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
