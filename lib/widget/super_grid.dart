import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuperGrid extends StatelessWidget {
  final List<String> cellIcons;
  final List<String> cellNames;

  const SuperGrid({
    super.key,
    required this.cellIcons,
    required this.cellNames,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemCount: cellNames.length,
      itemBuilder: (BuildContext context, int index) {
        String cellIcon = cellIcons[index];
        return GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/list_wheel');
                break;
              case 1:
                Navigator.pushNamed(context, '/video_page');
                break;
              case 2:
                Navigator.pushNamed(context, '/detail3');
                break;
              default:
                Navigator.pushNamed(context, '/home_page');
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                cellIcon,
                width: 64.0,
                height: 64.0,
              ),
              SizedBox(height: 8.0),
              Text(
                cellNames[index],
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
