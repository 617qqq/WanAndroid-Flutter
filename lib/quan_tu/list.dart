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
    //return buildList();
    return buildRow(context, 0);
  }

  double mImgHeight;

  void initState() {
    super.initState();
  }

  Widget buildList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext listContext, int listIndex) {
          return buildRow(listContext, listIndex);
        });
  }

  Widget buildRow(BuildContext listContext, int listIndex) {
    if (mImgHeight == 0) {
      mImgHeight = MediaQuery.of(context).size.width * 7 / 5;
    }
    return Column(
      children: <Widget>[
        Flex(
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
        ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 60,
            itemBuilder: (BuildContext rowListContext, int rowIndex) {
              return buildRowList(rowListContext, rowIndex, listIndex);
            })
      ],
    );
  }

  Widget buildRowList(BuildContext rowListContext, int rowIndex, int listIndex) {
    return Image(
      image: NetworkImage(getUrl(rowIndex, listIndex)),
      width: mImgHeight * 5 / 7,
      height: mImgHeight,
    );
  }

  String getUrl(int rowIndex, int listIndex) {
    return mUrl.substring(0, mUrl.indexOf("0.jpg")) + rowIndex.toString() + ".jpg";
  }

  String getRootImgUrl(int listIndex, int i) {
    return mUrl;
  }

  String mUrl = "http://d.quantuwang.co/2019/06/29/16970/0.jpg";
}
