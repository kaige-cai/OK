import 'package:flutter/material.dart';
import 'package:ok/data/constant.dart';

import '../widget/super_grid.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return SuperGrid(
      cellIcons: iconPaths,
      cellNames: cellNames,
    );
  }
}
