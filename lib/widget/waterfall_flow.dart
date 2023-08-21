import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'video_widget.dart';

class WaterfallFlowView extends StatelessWidget {
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
            return VideoWidget(
              videoUrl:
                  'https://v6-cold2.douyinvod.com/5666db95e335640654e710ecb5d47558/64e31f5e/video/tos/cn/tos-cn-ve-15c001-alinc2/oELOPANmCcEQiBenAQgvIlfh5zBMOyjizWAYBU/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1436&bt=1436&cs=0&ds=3&ft=GNvhKpVVywpuRFo8kmo~ySqTeaApozSW6vrKbZtormo0g3&mime_type=video_mp4&qs=0&rc=OmVlNmQ1ZjQ2aWc1O2VoM0BpM2Z4PGk6ZjtqbTMzNGkzM0BiY14tX19jX2AxXjA0YTIxYSNlXmk0cjQwX2VgLS1kLS9zcw%3D%3D&btag=e00088000&dy_q=1692602695&l=2023082115245565F54B31277A5401BE91',
            );
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
