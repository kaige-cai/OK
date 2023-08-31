import 'package:flutter/material.dart';

class SearchBoxPortrait extends StatefulWidget {
  const SearchBoxPortrait({super.key});

  @override
  SearchBoxPortraitState createState() => SearchBoxPortraitState();
}

class SearchBoxPortraitState extends State<SearchBoxPortrait> {
  static final TextEditingController controller = TextEditingController();

  // 搜索页form文字
  String searchStr = "";

  SearchBoxPortraitState() {
    // 监听搜索页form
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          searchStr = "";
          //默认显示
          centerContent = defaultDisplay();
          //显示历史记录
        });
      } else {
        setState(() {
          //动态搜索
          searchStr = controller.text;
          centerContent = ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (c, i) {
              return Row(
                children: <Widget>[
                  //图标
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 25,
                      bottom: 5.0,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black12,
                      semanticLabel: "列表显示label",
                      size: 25.0,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      bottom: 5.0,
                    ),
                    child: Text(
                      list[i],
                      style: const TextStyle(fontSize: 15),
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1.0, color: Colors.black12),
            itemCount: list.length,
          );
        });
      }
    });
  }

  // 建议
  static List<String> recommend = ['搜索建议1', '搜索建议2', '搜索建议3', '搜索建议4', '搜索建议5'];

  // 历史 暂时使用本地默认数据
  static List<String> history = ['历史记录1', '历史记录2', '历史记录3'];

  // 中间内容
  Widget centerContent = defaultDisplay();

  // 默认显示(推荐 + 历史记录)
  static Widget defaultDisplay() {
    return Container(
      padding: const EdgeInsets.only(
        left: 25,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10.0),
          const Text(
            "历史记录：",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 10,
            children: defaultData(history),
          ),
          const SizedBox(height: 10.0),
          const Text(
            "推荐：",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 10,
            children: defaultData(recommend),
          ),
        ],
      ),
    );
  }

  // 默认显示内容
  static List<Widget> defaultData(List<String> items) {
    return items.map((item) {
      return InkWell(
        child: Chip(
            label: Text(item),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onTap: () {
          //更新到搜索框
          controller.text = item;
        },
      );
    }).toList();
  }

  // 实时搜索结果
  static List list = [];

  // 实时搜索url
  String realTimeSearchUrl = "http://192.168.0.121:8091/article/test/";

  // 参数
  String paramStr = "qwe";

  @override
  Widget build(BuildContext context) {
    //屏幕宽度
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  //iconSize: 30,
                  iconSize: width * 1 / 12,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    //回到原来页面
                    controller.clear();
                    Navigator.pop(context);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  //设置 child 居中
                  //alignment: Alignment(0, 0),
                  height: width * 1 / 9,
                  width: 262,
                  //边框设置
                  decoration: BoxDecoration(
                    //背景
                    color: Colors
                        .black12, //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                    borderRadius:
                        const BorderRadius.all(Radius.circular(25.0)), //设置四周边框
                    border: Border.all(width: 1, color: Colors.white12),
                  ),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 3),
                      border: InputBorder.none,
                      hintText: '输入搜索内容...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                //清空按钮
                IconButton(
                    iconSize: 25,
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        controller.text = "";
                      });
                    })
              ],
            ),
            centerContent,
          ],
        ),
      ),
    ));
  }
}
