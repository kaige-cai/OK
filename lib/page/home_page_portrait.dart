import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ok/data/constant.dart';
import 'package:ok/page/store_page.dart';

class HomePagePortrait extends StatefulWidget {
  @override
  _HomePagePortraitState createState() => _HomePagePortraitState();
}

class _HomePagePortraitState extends State<HomePagePortrait>
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
      ), // 调整动画持续时间
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
                  searchResults.clear(); // 清空搜索结果
                  _searchController.clear(); // 清空搜索关键字
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
                      if (value.isEmpty) {
                        searchResults.clear(); // 清空搜索结果
                      } else {
                        _isSearching = true;
                        searchResults = allResults
                            .where((result) => result.contains(value))
                            .toList();
                      }
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
                  searchResults.clear(); // 清空搜索结果
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
            crossAxisCount: 8,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _toggleSearchResults,
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          ),
          BottomNavigationBar(
            items: [
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
          ),
          if (_isSearching) Expanded(child: _buildSearchResults()),
          // 添加展示搜索结果的部分
        ],
      ),
    );
  }
}
