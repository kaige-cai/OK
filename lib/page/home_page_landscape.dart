import 'package:flutter/material.dart';

class HomePageLandscape extends StatefulWidget {
  const HomePageLandscape({super.key});

  @override
  State<HomePageLandscape> createState() => _HomePageLandscapeState();
}

class _HomePageLandscapeState extends State<HomePageLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              DropdownButton<String>(
                value: 'all',
                items: [
                  DropdownMenuItem<String>(
                    value: 'all',
                    child: Text('所有'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'apps',
                    child: Text('应用'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'games',
                    child: Text('游戏'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'web',
                    child: Text('网页'),
                  ),
                ],
                onChanged: (value) {},
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '搜索应用、游戏、网页、任何东西',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
