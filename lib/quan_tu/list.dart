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

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  double mImgHeight;

  void initState() {
    super.initState();
  }

  Widget buildList() {
    mImgHeight = MediaQuery.of(context).size.width * 7 / 15;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext listContext, int listIndex) {
          return buildRow(listContext, listIndex);
        });
  }

  Widget buildRow(BuildContext listContext, int listIndex) {
    if(listIndex == 0){
      return Text(mImgHeight.toString());
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
                child: Image(
                  image: NetworkImage(getRootImgUrl(listIndex, 0)),
                  height: mImgHeight,
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
        Container(
          height: mImgHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 60,
              shrinkWrap: true,
              itemBuilder: (BuildContext rowListContext, int rowIndex) {
                return buildRowList(rowListContext, rowIndex, listIndex);
              }),
        )
      ],
    );
  }

  Widget buildRowList(BuildContext rowListContext, int rowIndex, int listIndex) {
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

  String getUrl(int rowIndex, int listIndex) {
    //return mUrl.substring(0, mUrl.indexOf("0.jpg")) + rowIndex.toString() + ".jpg";
    return mUrl;
  }

  String getRootImgUrl(int listIndex, int i) {
    return mUrl;
  }

  String mUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562574672464&di=c8934d75f252ea1be4977d21caef9417&imgtype=0&src=http%3A%2F%2Fattachments.gfan.net.cn%2Fforum%2F201501%2F12%2F174247ro1osnsoyx17m0ah.jpg";
}
