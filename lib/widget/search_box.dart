import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String _selectedCategory = 'all';
  bool _showSuggestions = false; // Track whether to show suggestions

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 128.0, left: 128.0, right: 128.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: _selectedCategory,
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
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    // Show suggestions when text is being entered
                    setState(() {
                      _showSuggestions = value.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '搜索应用、游戏、网页、任何东西',
                    hintStyle: TextStyle(color: Colors.grey), // Grey hint color
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
          if (_showSuggestions) ...[
            // Show suggestions only if _showSuggestions is true
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text('关键词1'),
                    onTap: () {
                      // Handle suggestion tap
                      // You can update the text field value here
                    },
                  ),
                  ListTile(
                    title: Text('关键词2'),
                    onTap: () {
                      // Handle suggestion tap
                    },
                  ),
                  // Add more ListTile items for additional suggestions
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
