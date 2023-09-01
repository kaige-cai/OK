import 'package:flutter/material.dart';

import '../data/smash_class.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Object? arguments = ModalRoute.of(context)!.settings.arguments;
    final Category category = arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.0,
        ),
        shrinkWrap: true,
        itemCount: category.items.length,
        itemBuilder: (context, index) {
          final item = category.items[index];
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item.iconPath, width: 64.0, height: 64.0),
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
