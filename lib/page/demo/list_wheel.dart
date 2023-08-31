import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListWheelPage extends StatefulWidget {
  const ListWheelPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListWheelPageState();
}

class _ListWheelPageState extends State<ListWheelPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    super.initState();
  }

  Future<List<String>> _refreshData() async {
    return pics;
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: DetailPage(link: pics[currentIndex]),
                );
              },
            ),
          );
        },
        child: Hero(
          tag: 'hello',
          child: ListWheelScrollView(
            onSelectedItemChanged: (index) {
              currentIndex = index;
            },
            controller: FixedExtentScrollController(initialItem: 2),
            squeeze: 1.5,
            physics: const BouncingScrollPhysics(),
            itemExtent: 1,
            children: List.generate(
              pics.length,
              (i) => ItemTile(
                picUrl: pics[i],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.picUrl});

  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(32.0),
              child: CachedNetworkImage(
                imageUrl: picUrl,
                placeholder: (context, url) => Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: const Placeholder(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                    const RefreshProgressIndicator(),
                  ],
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              left: 12.0,
              child: ClipOval(
                child: Image.asset(''),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.link});

  final String link;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var defaultScale = 1.0;
  var defaultPos = const Offset(0.0, 0.0);
  var defaultSize = const Size(0.0, 0.0);
  var lastPosition = const Offset(0.0, 0.0);
  var startMovePosition = const Offset(0.0, 0.0);
  var edgePosition = const Offset(0.0, 0.0);
  int numPointers = 0;
  var lastScale = 1.0; // 多次放大缩小的时候保存上一次的结果
  var scaling = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    defaultSize = size * defaultScale;
    final dx = -(defaultSize.width - size.width);
    final dy = -(defaultSize.height - size.height);
    edgePosition = Offset(dx, dy);
    return Scaffold(
      body: Hero(
        tag: 'hello',
        child: Listener(
          onPointerDown: (_) => numPointers++,
          onPointerUp: (_) => numPointers--,
          child: GestureDetector(
            onScaleStart: _scaleStart,
            onScaleEnd: _scaleEnd,
            onScaleUpdate: _scaleUpdate,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: defaultPos.dy,
                  left: defaultPos.dx,
                  width: defaultSize.width,
                  height: defaultSize.height,
                  child: Transform.scale(
                    scale: defaultScale,
                    child: CachedNetworkImage(
                      imageUrl: widget.link,
                      errorWidget: (_, __, ___) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _scaleStart(ScaleStartDetails detail) {
    if (numPointers == 1 && !scaling) {
      lastPosition = defaultPos; // 标记下位置
      startMovePosition = detail.focalPoint;
    }
    if (numPointers == 2) {
      if (!scaling) {
        scaling = true;
      }
    }
  }

  void _scaleUpdate(ScaleUpdateDetails detail) {
    if (numPointers == 1 && !scaling) {
      final distance = detail.focalPoint - startMovePosition; // 移动距离
      final newPosition = lastPosition + distance; // 移动
      var x = newPosition.dx;
      if (x > 0) {
        x = 0.0;
      }
      if (x < edgePosition.dx) {
        x = edgePosition.dx;
      }
      var y = newPosition.dy;
      if (y > 0) {
        y = 0.0;
      } else if (y < edgePosition.dy) {
        y = edgePosition.dy;
      }
      defaultPos = Offset(x, y); // 移动
      setState(() {});
    }
    if (numPointers == 2) {
      if (scaling) {
        var newScale = lastScale * detail.scale;
        if (newScale < 1.0) {
          newScale = 1.0;
        } else if (newScale > 5.0) {
          newScale = 5.0;
        }
        defaultScale = newScale;
        // 计算大小
        setState(() {});
      }
    }
  }

  void _scaleEnd(ScaleEndDetails detail) {
    if (scaling) {
      lastScale = defaultScale;
      scaling = false;
    }
  }
}

List<String> pics = [
  'https://pic.imgdb.cn/item/6406f072f144a010071a646b.png',
  'https://img.freepik.com/free-photo/breast-screening-is-very-important-every-woman_329181-14953.jpg?w=2000&t=st=1690424191~exp=1690424791~hmac=d7c0ea81c1de4d241ad61b8de8ec630fb7ba095447f10f2c4c54b38f5402776e',
  'https://pic.downk.cc/item/5e6d9485e83c3a1e3ab48b84.jpg',
  'https://pic.downk.cc/item/5e6d9485e83c3a1e3ab48b86.jpg',
  'https://pic.downk.cc/item/5e6d9473e83c3a1e3ab483dc.jpg',
  'https://pic.downk.cc/item/5e6d92f9e83c3a1e3ab3c10e.jpg',
];
