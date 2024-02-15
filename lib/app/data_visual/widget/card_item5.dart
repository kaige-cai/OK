import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/app/data_visual/model/data_model.dart';

import '../page/full_screen_image_gallery_page.dart';

class CardItem5 extends StatelessWidget {
  const CardItem5({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImageGalleryPage(
              images: [dataModel.pic],
              heroTag: '', // 传递图片列表
            ),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Center(
                child: CachedNetworkImage(imageUrl: dataModel.pic),
              ),
              Positioned(
                bottom: 200.0,
                left: 12.0,
                right: 12.0,
                child: Center(
                  child: Text(
                    dataModel.title,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'KT',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
