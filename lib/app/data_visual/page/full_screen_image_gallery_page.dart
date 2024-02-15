import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageGalleryPage extends StatelessWidget {
  const FullScreenImageGalleryPage({
    Key? key,
    required this.images,
    required this.heroTag,
  }) : super(key: key);

  final List<String> images;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48.0),
      child: Scaffold(
        body: PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (context, index) {
            final currentImage = images[index];
            return PhotoViewGalleryPageOptions(
              heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
              imageProvider: _getImageProvider(currentImage),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: PageController(),
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('http')) {
      // 如果是网络图片路径
      return CachedNetworkImageProvider(imagePath);
    } else {
      // 否则认为是本地图片路径
      return AssetImage(imagePath);
    }
  }
}
