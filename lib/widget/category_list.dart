import 'package:flutter/cupertino.dart';
import 'package:ok/app/chat_gpt/main.dart';
import 'package:ok/app/video/video_page.dart';

import '../page/category_details_page.dart';

class Category {
  final String name;
  final List<Item> items;

  Category(this.name, this.items);
}

class Item {
  final String name;
  final String iconPath;

  Item(this.name, this.iconPath);
}

List<Category> categories = [
  Category('Category 1', [
    Item('Item 1', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('Category 2', [
    Item('Item 1', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('Category 3', [
    Item('Item 1', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('Category 4', [
    Item('Item 1', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('Category 5', [
    Item('Item 1', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('Category 6', [
    Item('Item A', 'asset/icon/app_icon.png'),
    Item('Item B', 'asset/icon/app_icon.png'),
    Item('Item C', 'asset/icon/app_icon.png'),
  ]),
  // 添加更多类别和项目
];

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, categoryIndex) {
        final category = categories[categoryIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CategoryDetailsPage(category),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 18.0),
                    Icon(
                      CupertinoIcons.forward,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: category.items.length,
                itemBuilder: (context, itemIndex) {
                  final item = category.items[itemIndex];
                  return GestureDetector(
                    onTap: () {
                      switch (item.name) {
                        case 'Item 1':
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ChatGPTPage(),
                            ),
                          );
                          break;
                        case 'Item 2':
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => VideoPage(),
                            ),
                          );
                          break;
                        // Add more cases for different app names and pages
                        default:
                          // Default action if item.name doesn't match any case
                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            item.iconPath,
                            width: 60,
                            height: 60,
                          ),
                          Text(item.name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
