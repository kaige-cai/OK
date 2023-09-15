import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ok/data/constant.dart';
import 'package:ok/page/store_page.dart';

import '../widget/app_lifecycle_reactor.dart';
import '../widget/app_open_ad_manager.dart';

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

  BannerAd? _bannerAd;

  final String _adUnitId =
      Platform.isAndroid ? 'ca-app-pub-9275143816186195/7092152699' : '';
  late AppLifecycleReactor _appLifecycleReactor;

  @override
  void initState() {
    super.initState();
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

    _loadBannerAd();
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    _appLifecycleReactor =
        AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
    _appLifecycleReactor.listenToAppStateChanges();
    appOpenAdManager.showAdIfAvailable();
  }

  void _loadBannerAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: AdSize.largeBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
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
            Stack(
              children: [
                if (_bannerAd != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: SizedBox(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      ),
                    ),
                  )
              ],
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
