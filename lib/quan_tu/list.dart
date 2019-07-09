import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to Flutter",
      theme: new ThemeData(primaryColor: Colors.black),
      home: new ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListPageState();
  }
}

class ListPageState extends State<ListPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  double mImgHeight;
  AnimationController controller;
  Animation growHeight, reduceHeight;
  int mSelectedColumn = -1, mSelectedLastColumn = -1, mSelectedRow = -1;
  double startReduceHeight, startGrowHeight;

  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Widget buildList() {
    mImgHeight = MediaQuery.of(context).size.width * 7 / 15;

    reduceHeight = new Tween(
      begin: startReduceHeight,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(.0, 0.6, curve: Curves.ease)));

    growHeight = new Tween(
      begin: startGrowHeight,
      end: mImgHeight,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(.0, 0.6, curve: Curves.ease)))
      ..addListener(() {
        setState(() {
        });
      });

    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext listContext, int listIndex) {
          return buildRowItem(listContext, listIndex);
        });
  }

  Widget buildRowItem(BuildContext listContext, int listIndex) {
    if (listIndex == 0) {
      return Text("2");
    }
    return Column(
      children: <Widget>[
        Container(
          height: mImgHeight,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (mSelectedColumn == listIndex) {
                      return;
                    } else {
                      setState(() {
                        //变小动画的高度，如果变大到一半选择其他栏，则从当前高度缩小
                        startReduceHeight = growHeight.value;
                        //变大动画的高度，如果选中栏为正在缩小栏
                        startGrowHeight = mSelectedLastColumn == listIndex ? reduceHeight.value : 0.0;
                        mSelectedLastColumn = mSelectedColumn;
                        mSelectedColumn = listIndex;
                        controller.reset();
                        controller.forward();
                      });
                    }
                  },
                  child: Image(
                    image: NetworkImage(getRootImgUrl(listIndex, 0)),
                    height: mImgHeight,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(getRootImgUrl(listIndex, 1)),
                  height: mImgHeight,
                ),
              ),
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(getRootImgUrl(listIndex, 2)),
                  height: mImgHeight,
                ),
              ),
            ],
          ),
        ),
        buildSubList(listIndex)
      ],
    );
  }

  Widget buildSubList(int listIndex) {
    return Container(
      height: mSelectedColumn == listIndex
          ? growHeight.value
          : mSelectedLastColumn == listIndex ? reduceHeight.value : 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 60,
          shrinkWrap: true,
          itemBuilder: (BuildContext rowListContext, int rowIndex) {
            return buildRowListItem(rowListContext, rowIndex, listIndex);
          }),
    );
  }

  Widget buildRowListItem(BuildContext rowListContext, int rowIndex, int listIndex) {
    if (mImgHeight == null) {
      mImgHeight = MediaQuery.of(context).size.width * 7 / 5;
    }
    var rowItemWidth = mImgHeight * 5 / 7;
    return Image(
      image: NetworkImage(getUrl(rowIndex, listIndex)),
      width: rowItemWidth,
      height: mImgHeight,
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  String getUrl(int rowIndex, int listIndex) {
    //return mUrl.substring(0, mUrl.indexOf("0.jpg")) + rowIndex.toString() + ".jpg";
    return "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562580250520&di=e42c739f247e09f397ec4ffab4cd99fe&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201702%2F05%2F20170205213415_u2Bty.jpeg";
  }

  String getRootImgUrl(int listIndex, int i) {
    return mUrl;
  }

  String mUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562574672464&di=c8934d75f252ea1be4977d21caef9417&imgtype=0&src=http%3A%2F%2Fattachments.gfan.net.cn%2Fforum%2F201501%2F12%2F174247ro1osnsoyx17m0ah.jpg";
}
