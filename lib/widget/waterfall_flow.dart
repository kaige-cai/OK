import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'video_widget.dart';

class WaterfallFlowView extends StatefulWidget {
  const WaterfallFlowView({super.key});

  @override
  State<WaterfallFlowView> createState() => _WaterfallFlowViewState();
}

class _WaterfallFlowViewState extends State<WaterfallFlowView> {
  List<Widget> shuffledItems = [];

  // 定义包含多个视频链接的列表
  final List<String> videoUrls = [
    'https://v16m-default.akamaized.net/3ed87140f071f22194290c66f92ab03c/6503f7d6/video/tos/alisg/tos-alisg-pve-0037c001/o8FE4bcjOgeRnoDIgoCDADBUhB8eQMOmkVFQXX/?a=0&ch=0&cr=0&dr=0&lr=all&cd=0%7C0%7C0%7C0&cv=1&br=2458&bt=1229&bti=OHYpOTY0Zik7OzlmOm01MzE6ZC4xMDo%3D&cs=0&ds=3&ft=iJOG.y7oZZv0PD1.W_Rxg9wgjejCBEeC~&mime_type=video_mp4&qs=0&rc=ZDM4PGVmZDpmMzM3OjkzOUBpM2RqNzQ6Zmp2bTMzODczNEBiMGM0Ni0uNmIxLmBfNV8vYSNyYm4xcjRvL2xgLS1kMTFzcw%3D%3D&l=202309150020566DE962030365DB1993CE&btag=e00088000',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjdkiajc77u5fm11ptm0',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0d00fg10000cjm7d63c77u3plp1oigg',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fa40000boul940nrm1hl30b2f3g',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjhemibc77u642it5ov0',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjpihrjc77u3gdldcmrg',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjesu1jc77uc8cstkukg',
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjrg5orc77u1f1n1u7o0',
  ];

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
        items.add(VideoWidget(videoUrl: shuffledVideoUrls[videoIndex]));
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
    _shuffleItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
}
