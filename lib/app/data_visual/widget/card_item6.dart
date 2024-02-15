import 'package:flutter/material.dart';
import 'package:ok/app/data_visual/model/data_model.dart';

import '../page/full_screen_image_gallery_page.dart';

class CardItem6 extends StatelessWidget {
  const CardItem6({super.key, required this.dataModel});

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
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
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(dataModel.pic, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
