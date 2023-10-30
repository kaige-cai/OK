import 'package:flutter/material.dart';
import 'package:ok/data/constant.dart';
import 'package:ok/page/store_page.dart';

class HomePagePortrait extends StatefulWidget {
  const HomePagePortrait({super.key});

  @override
  HomePagePortraitState createState() => HomePagePortraitState();
}

class HomePagePortraitState extends State<HomePagePortrait>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  List<String> allResults = []; // 所有结果
  List<String> searchResults = []; // 搜索结果

  late AnimationController _animationController;

  final List<Widget> _pages = [
    StorePage(categories: appCategories),
    StorePage(categories: gameCategories),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ), // 调整动画持续时间
    );

    // 初始化所有结果
    allResults.addAll(
      appCategories.expand(
        (category) => category.items.map((item) => item.name),
      ),
    );

    allResults.addAll(
      gameCategories.expand(
        (category) => category.items.map((item) => item.name),
      ),
    );

    super.initState();
  }

  /* Widget _buildPaymentRow(String method, String details) {
    return Row(
      children: <Widget>[
        Text('$method: $details'),
        Spacer(),
        InkWell(
          onTap: () {
            // 在此处理点击转账操作
            if (method == 'Paypal') {
              // 处理Paypal转账
            } else {
              // 处理其他支付方式的转账
            }
          },
          child: Text('点击转账'),
        ),
      ],
    );
  }*/

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSearchResults() {
    if (_isSearching) {
      _animationController.reverse().whenComplete(() {
        setState(() {
          _isSearching = false;
          searchResults.clear(); // 清空搜索结果
          _searchController.clear(); // 清空搜索关键字
        });
      });
    } else {
      _animationController.forward();
      setState(() {
        _isSearching = true;
        searchResults.clear(); // 清空搜索结果
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('asset/icon/app_icon.png'),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // 打开抽屉
            /* showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('开发不易，还请支持！'),
                  content: Column(
                    children: <Widget>[
                      Text('本App郑重承诺：永久免费绿色开源无广告！'),
                      SizedBox(height: 20),
                      _buildPaymentRow('支付宝', '18852284878'),
                      _buildPaymentRow('微信', '18852284878'),
                      _buildPaymentRow('Paypal', 'https://paypal.me/mr0cai'),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text('给个5星好评吧'),
                          SizedBox(width: 10),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 30,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('关闭'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );*/
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _toggleSearchResults,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: '应用',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.games),
                label: '游戏',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ), // 添加展示搜索结果的部分
        ],
      ),
    );
  }
}
