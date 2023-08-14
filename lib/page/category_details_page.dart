import 'package:flutter/cupertino.dart';

import '../data/smash_class.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Category category;

  CategoryDetailsPage(this.category);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(category.name),
      ),
      child: GridView.builder(
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
