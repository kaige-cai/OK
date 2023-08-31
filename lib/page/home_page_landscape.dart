import 'package:flutter/material.dart';
import 'package:ok/widget/search/search_box_landscape.dart';

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
        physics: const BouncingScrollPhysics(),
        children: const [
          SearchBoxLandscape(),
        ],
      ),
    );
  }
}
