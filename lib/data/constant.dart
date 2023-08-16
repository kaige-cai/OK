import 'smash_class.dart';

final List<String> cellNames = [
  '列表',
  'Alice',
  'Bob',
  'Eve',
  'Michael',
  'Emily',
  'David',
  'Sophia',
  'Liam',
  'Olivia',
  // Add more names here if needed
];

final List<String> iconPaths = [
  'asset/icon/demo.svg',
  'asset/icon/video.svg',
  'asset/icon/icon3.svg',
  'asset/icon/icon4.svg',
  'asset/icon/icon5.svg',
  'asset/icon/icon6.svg',
  'asset/icon/icon7.svg',
  'asset/icon/icon8.svg',
  'asset/icon/icon9.svg',
  'asset/icon/icon10.svg',
  // Add more SVG icon paths here if needed, make sure they match the actual paths
];

final List<String> imageUrls = [
  'https://windows10spotlight.com/wp-content/uploads/2016/10/244c78a0df569a336ee00eab323cad79.jpg',
  'https://windows10spotlight.com/wp-content/uploads/2023/08/cb83652894785d8f3d8be772c50606db.jpg',
  'https://windows10spotlight.com/wp-content/uploads/2023/08/ab3f0cbbd29067d2962f4308ed44f289.jpg',
  'https://windows10spotlight.com/wp-content/uploads/2023/08/b50c9d1dc309dcd56d8424d9d4bfb373.jpg',
  'https://windows10spotlight.com/wp-content/uploads/2023/08/d0d0865c317d2f08aee9071b3e250a9b.jpg',
];

List<Category> appCategories = [
  Category('常用', [
    Item('全能计算器', 'asset/icon/app_icon.png'),
    Item('全能相机', 'asset/icon/app_icon.png'),
    Item('天气预报', 'asset/icon/app_icon.png'),
    Item('新闻', 'asset/icon/app_icon.png'),
    Item('自动触摸点击器', 'asset/icon/app_icon.png'),
    Item('运动计步', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('图片', [
    Item('美女图片', 'asset/icon/app_icon.png'),
    Item('壁纸图片', 'asset/icon/app_icon.png'),
    Item('PS图片编辑', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('视频', [
    Item('短视频', 'asset/icon/app_icon.png'),
    Item('刷视频', 'asset/icon/app_icon.png'),
    Item('Pr视频剪辑', 'asset/icon/app_icon.png'),
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

List<Category> gameCategories = [
  Category('抽奖', [
    Item('转盘抽奖', 'asset/icon/app_icon.png'),
    Item('九宫格抽奖', 'asset/icon/app_icon.png'),
    Item('刮刮乐', 'asset/icon/app_icon.png'),
    Item('扭蛋机', 'asset/icon/app_icon.png'),
    Item('翻牌子', 'asset/icon/app_icon.png'),
    Item('彩票', 'asset/icon/app_icon.png'),
    Item('跳棋', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('分类2', [
    Item('敲木鱼', 'asset/icon/app_icon.png'),
    Item('Item 2', 'asset/icon/app_icon.png'),
    Item('Item 3', 'asset/icon/app_icon.png'),
    Item('Item 4', 'asset/icon/app_icon.png'),
    Item('Item 5', 'asset/icon/app_icon.png'),
    Item('Item 6', 'asset/icon/app_icon.png'),
    Item('Item 7', 'asset/icon/app_icon.png'),
    Item('Item 8', 'asset/icon/app_icon.png'),
    Item('Item 9', 'asset/icon/app_icon.png'),
  ]),
  Category('分类3', [
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
  Category('分类4', [
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
  Category('分类5', [
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
  Category('分类6', [
    Item('Item A', 'asset/icon/app_icon.png'),
    Item('Item B', 'asset/icon/app_icon.png'),
    Item('Item C', 'asset/icon/app_icon.png'),
  ]),
  // 添加更多类别和项目
];
