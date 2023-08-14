import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../data/constant.dart';
import '../data/page_name.dart';

class FunCarouseSlider extends StatelessWidget {
  const FunCarouseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => targetPages[index]),
            );
          },
          child: Container(
            child: Image.network(imageUrls[index], fit: BoxFit.cover),
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
