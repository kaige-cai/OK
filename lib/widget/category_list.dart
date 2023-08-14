import 'package:flutter/cupertino.dart';

import '../data/constant.dart';
import '../data/smash_class.dart';
import '../page/category_details_page.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

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
              height: 100.0,
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
                          /* Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ChatGPTPage(),
                            ),
                          );*/
                          Navigator.pushNamed(context, '/chat_gpt_page');
                          break;
                        case 'Item 2':
                          /* Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => VideoPage(),
                            ),
                          );*/
                          Navigator.pushNamed(context, '/video_page');
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
