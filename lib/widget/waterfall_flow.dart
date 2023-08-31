import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'video_widget.dart';

class WaterfallFlowView extends StatelessWidget {
  const WaterfallFlowView({super.key});

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
            return const VideoWidget(
                videoUrl:
                    'https://api.amemv.com/aweme/v1/play/?video_id=v0200fg10000cjdkiajc77u5fm11ptm0');
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
