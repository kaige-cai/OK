import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/constant.dart';

class FunCarouseSlider extends StatefulWidget {
  const FunCarouseSlider({super.key});

  @override
  State<FunCarouseSlider> createState() => _FunCarouseSliderState();
}

class _FunCarouseSliderState extends State<FunCarouseSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                break;
              case 1:
                break;
              case 2:
                break;
              case 3:
                break;
              case 4:
                break;
              default:
                break;
            }
          },
          child: CachedNetworkImage(
            imageUrl: imageUrls[index],
            alignment: Alignment.center,
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            placeholder: (context, url) => const AspectRatio(
              aspectRatio: 1.0,
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(milliseconds: 1400),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.ease,
        enlargeCenterPage: true,
      ),
    );
  }
}
