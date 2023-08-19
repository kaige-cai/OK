import 'package:flutter/material.dart';
import 'package:ok/widget/carousel_slider.dart';
import '../data/smash_class.dart';
import '../widget/category_list.dart';

class StorePage extends StatelessWidget {
  final List<Category> categories;

  const StorePage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunCarouseSlider(),
        CategoryList(categories: categories),
        // StaggeredGrid(),
      ],
    );
  }
}
