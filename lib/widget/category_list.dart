import 'package:flutter/cupertino.dart';

import '../data/app_routes.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, categoryIndex) {
        final category = categories[categoryIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, detailsPage, arguments: category);
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 18.0),
                    const Icon(
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
                physics: const BouncingScrollPhysics(),
                itemCount: category.items.length,
                itemBuilder: (context, itemIndex) {
                  final item = category.items[itemIndex];
                  return GestureDetector(
                    onTap: () {
                      switch (item.name) {
                        case '数据可视化':
                          Navigator.of(context).pushNamed(dataVisualApp);
                          break;
                        case '全能计算器':
                          Navigator.of(context).pushNamed(calculatorPage);
                          break;
                        case '全能相机':
                          Navigator.of(context).pushNamed(cameraPage);
                          break;
                        case '转盘抽奖':
                          Navigator.of(context).pushNamed(wheelSurf);
                          break;
                        case '随机数抽奖':
                          Navigator.of(context).pushNamed(randomLottery);
                          break;
                        case '贪吃蛇':
                          Navigator.of(context).pushNamed(snakeGame);
                          break;
                        default:
                          break;
                      }
                      // Navigator.of(context).pushNamed('/video_page');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
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
