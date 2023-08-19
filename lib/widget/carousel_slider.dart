import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/constant.dart';

class FunCarouseSlider extends StatelessWidget {
  const FunCarouseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return GestureDetector(
          onTap: () {

          },
          child: Container(
            // child: Image.network(imageUrls[index], fit: BoxFit.cover),
            child: CachedNetworkImage(
              imageUrl: imageUrls[index],
              alignment: Alignment.center,
              fadeInCurve: Curves.easeIn,
              fadeOutCurve: Curves.easeOut,
              placeholder: (context, url) => AspectRatio(
                aspectRatio: 1.0,
                child: CupertinoActivityIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(milliseconds: 1400),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.slowMiddle,
        enlargeCenterPage: true,
      ),
    );
  }
}
