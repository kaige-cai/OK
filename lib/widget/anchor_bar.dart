import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavItemBTM {
  NavItemBTM({
    required this.text,
    required this.iconPath,
  });

  final String text;
  final String iconPath;
}

class AnchorBar extends StatefulWidget {
  AnchorBar({
    super.key,
    required this.items,
    required this.centerItem,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    required this.elevation,
    this.notchMargin = 8.0,
  }) {
    assert(items.length == 2 || items.length == 4);
  }

  final List<NavItemBTM> items;
  final Widget centerItem;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final double elevation;
  final double notchMargin;

  @override
  createState() => _AnchorBarState();
}

class _AnchorBarState extends State<AnchorBar> {
  int _selectedIndex = 0;

  _updateIndex(index) {
    widget.onTabSelected(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      widget.items.length,
      (index) {
        return _buildTabItems(
          item: widget.items[index],
          index: index,
          onPressed: _updateIndex,
        );
      },
    );
    items.insert(items.length >> 1, _buildMiddleTabItems());
    return BottomAppBar(
      elevation: widget.elevation,
      notchMargin: widget.notchMargin,
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItems() => Expanded(
        child: SizedBox(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: widget.iconSize), widget.centerItem],
          ),
        ),
      );

  Widget _buildTabItems({
    required NavItemBTM item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(index),
        child: SizedBox(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(item.iconPath,
                  width: widget.iconSize, height: widget.iconSize),
              const SizedBox(height: 3.0),
              Text(
                item.text,
                style: TextStyle(color: color, fontSize: 10.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
