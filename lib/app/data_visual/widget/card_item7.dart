import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/app/data_visual/model/data_model.dart';

import '../page/full_screen_image_gallery_page.dart';

class CardItem7 extends StatelessWidget {
  const CardItem7({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              insetPadding: EdgeInsets.zero,
              child: FullScreenImageGalleryPage(
                heroTag: dataModel.pic,
                images: [dataModel.pic],
              ),
            );
          },
        );
      },
      child: Card(
        child: Hero(
          tag: dataModel.pic,
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 200.0),
                AspectRatio(
                  aspectRatio: 1.0,
                  child: CachedNetworkImage(
                    imageUrl: dataModel.pic,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Text(
                    dataModel.title,
                    style: const TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KT',
                      height: 1.0,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
