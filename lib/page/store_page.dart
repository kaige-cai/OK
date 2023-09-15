import 'package:flutter/material.dart';
import 'package:ok/widget/waterfall_flow.dart';

import '../data/smash_class.dart';
import '../widget/carousel_slider.dart';
import '../widget/category_list.dart';
import '../widget/staggered_grid.dart';

class StorePage extends StatelessWidget {
  final List<Category> categories;

  const StorePage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        const FunCarouseSlider(),
        CategoryList(categories: categories),
        const FunStaggeredGridView(),
        WaterfallFlowView()
      ],
    );
  }
}
