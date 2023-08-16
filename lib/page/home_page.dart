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
  TextEditingController _searchController = TextEditingController();

  List<String> allResults = []; // 所有结果
  List<String> searchResults = []; // 搜索结果

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
        searchResults = allResults;
        print(searchResults);
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
        margin: EdgeInsets.all(2.0),
        height: 64.0,
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
              child: Icon(CupertinoIcons.chevron_left),
            ),
            Expanded(
              child: CupertinoTextField(
                controller: _searchController,
                placeholder: '搜索应用和游戏',
                padding: EdgeInsets.zero,
                cursorHeight: 24.0,
                // 调整光标的高度
                style: TextStyle(color: Colors.black),
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                ),
                onChanged: (value) {
                  setState(() {
                    setState(() {
                      _isSearching = true;
                      searchResults = allResults
                          .where((result) => result.contains(value))
                          .toList();
                    });
                  });
                },
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _isSearching = true;
                  _animationController.forward();
                  searchResults = allResults
                      .where(
                          (result) => result.contains(_searchController.text))
                      .toList();
                });
              },
              child: Icon(CupertinoIcons.search),
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return Center(
              child: Text(searchResults[index]),
            );
          },
        ),
      ),
    );
  }
}
