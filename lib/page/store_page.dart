import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ok/widget/staggered_grid.dart';

import '../widget/category_list.dart';

class StorePage extends StatelessWidget {
  final String category;

  StorePage({required this.category});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100.0),
          CarouselSlider(
            items: [
              GestureDetector(
                onTap: () {
                  // TODO: Implement carousel item click
                },
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('App Image 1'),
                  ),
                ),
              ),
              // Add more carousel items
            ],
            options: CarouselOptions(
              height: 220.0,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 1500),
            ),
          ),
          CategoryList(),
          StaggeredGrid(),
        ],
      ),
    );
  }
}
