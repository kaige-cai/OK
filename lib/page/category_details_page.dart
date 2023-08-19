import 'package:flutter/material.dart';

import '../data/smash_class.dart';

class CategoryDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.0,
        ),
        shrinkWrap: true,
        itemCount: category.items.length,
        itemBuilder: (context, index) {
          final item = category.items[index];
          return Container(
            padding: EdgeInsets.all(10),
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
