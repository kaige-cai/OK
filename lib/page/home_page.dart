import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ok/data/constant.dart';
import 'package:ok/page/store_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isSearching = false;
  String _searchKeyword = '';

  List<String> allResults = []; // 所有结果
  List<String> filteredResults = []; // 过滤后的结果

  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Widget> _pages = [
    StorePage(categories: appCategories),
    StorePage(categories: gameCategories),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ), // Adjust animation duration as needed
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
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
  }

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
        });
      });
    } else {
      _animationController.forward();
      setState(() {
        _isSearching = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: '应用',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.game_controller_solid),
            label: '游戏',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          return CupertinoPageScaffold(
              backgroundColor: Colors.white,
              navigationBar: CupertinoNavigationBar(
                leading: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Image.asset('asset/icon/app_icon.png'),
                ),
                middle: _buildAppBarWithSearch(),
              ),
              child: _isSearching ? _buildSearchResults() : _pages[index]);
        });
      },
    );
  }

  Widget _buildAppBarWithSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (_isSearching) _buildSearchField(),
        _isSearching
            ? Container()
            : CupertinoButton(
                child: Icon(CupertinoIcons.search),
                padding: EdgeInsets.zero,
                onPressed: () {
                  _toggleSearchResults();
                },
              ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 0.0, right: 32.0),
        height: 32.0,
        decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                _animationController.reverse();
                setState(() {
                  _isSearching = false;
                });
              },
              child: Icon(CupertinoIcons.left_chevron),
            ),
            Expanded(
              child: CupertinoTextField(
                placeholder: '搜索应用和游戏',
                padding: EdgeInsets.zero,
                style: TextStyle(color: Colors.black),
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchKeyword = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double animationOffset = isLandscape ? 220.0 : 100.0;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value * (300.0 - animationOffset)),
          child: child,
        );
      },
      child: Container(
        height: 300,
        color: CupertinoColors.white,
        child: ListView.builder(
          itemCount: filteredResults.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredResults[index]),
            );
          },
        ),
      ),
    );
  }
}
