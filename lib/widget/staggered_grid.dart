import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FunStaggeredGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: <Widget>[
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              color: Colors.greenAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.yellowAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.redAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.greenAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.blueAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.orange,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.indigoAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: Container(
              color: Colors.purpleAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              color: Colors.redAccent,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: Container(
              color: Colors.yellow,
              child: Image.asset('asset/icon/app_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
