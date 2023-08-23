import 'package:flutter/material.dart';
import 'package:ok/widget/search_box.dart';

class HomePageLandscape extends StatefulWidget {
  const HomePageLandscape({super.key});

  @override
  State<HomePageLandscape> createState() => _HomePageLandscapeState();
}

class _HomePageLandscapeState extends State<HomePageLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SearchBox(),
        ],
      ),
    );
  }
}
