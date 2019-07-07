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

  Widget buildList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext listContext, int listIndex) {
          return buildRow(listContext, listIndex);
        });
  }

  Widget buildRow(BuildContext listContext, int listIndex) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image(
                image: NetworkImage("http://d.quantuwang.co/2019/06/29/16970/1.jpg"),
                height: 300,
              ),
            ),
            Expanded(
              flex: 1,
              child: Image(
                image: NetworkImage("http://d.quantuwang.co/2019/06/29/16970/1.jpg"),
                height: 300,
              ),
            ),
            Expanded(
              flex: 1,
              child: Image(
                image: NetworkImage("http://d.quantuwang.co/2019/06/29/16970/1.jpg"),
                height: 300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
