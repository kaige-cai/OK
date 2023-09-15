import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'video_widget.dart';

class WaterfallFlowView extends StatelessWidget {
  WaterfallFlowView({super.key});

  // 定义包含多个视频链接的列表
  final List<String> videoUrls = [
    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjdkiajc77u5fm11ptm0',
    'https://v16m-default.akamaized.net/3ed87140f071f22194290c66f92ab03c/6503f7d6/video/tos/alisg/tos-alisg-pve-0037c001/o8FE4bcjOgeRnoDIgoCDADBUhB8eQMOmkVFQXX/?a=0&ch=0&cr=0&dr=0&lr=all&cd=0%7C0%7C0%7C0&cv=1&br=2458&bt=1229&bti=OHYpOTY0Zik7OzlmOm01MzE6ZC4xMDo%3D&cs=0&ds=3&ft=iJOG.y7oZZv0PD1.W_Rxg9wgjejCBEeC~&mime_type=video_mp4&qs=0&rc=ZDM4PGVmZDpmMzM3OjkzOUBpM2RqNzQ6Zmp2bTMzODczNEBiMGM0Ni0uNmIxLmBfNV8vYSNyYm4xcjRvL2xgLS1kMTFzcw%3D%3D&l=202309150020566DE962030365DB1993CE&btag=e00088000',
    'https://v11-coldf.douyinvod.com/3e1a294b58b071e9d965903040231667/6503b70f/video/tos/cn/tos-cn-ve-15c001-alinc2/okEaDANnkBfPKRx8DQpHQAgNAAhYb7Igc9R7fY/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=2185&bt=2185&cs=0&ds=4&ft=GNvhKpVVywpuRFo8kmo~ySqTeaApCsDeEvrKL2sprmo0g3&mime_type=video_mp4&qs=0&rc=NzNmaDo5OzRmZTk2NDc4ZEBpamw0bzY6Zjk6bTMzNGkzM0AuMDBgXmJhNS4xNjUuXl4zYSNkbG1tcjQwYWpgLS1kLWFzcw%3D%3D&btag=e00090000&dy_q=1694738672&l=20230915084432A90961C89239F03F13B6',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: 30,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        itemBuilder: (BuildContext context, int index) {
          if (Random().nextBool()) {
            // 随机选择一个视频链接
            final randomVideoUrl =
                videoUrls[Random().nextInt(videoUrls.length)];
            return VideoWidget(videoUrl: randomVideoUrl);
          } else {
            return Card(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: Random().nextInt(200) + 200,
                imageUrl:
                    'https://windows10spotlight.com/wp-content/uploads/2023/08/203ea8c98a1c1bf13cc170319a8671fd.jpg',
              ),
            );
          }
        },
      ),
    );
  }
}
