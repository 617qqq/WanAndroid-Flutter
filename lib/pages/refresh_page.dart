import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RefreshPageState();
  }
}

class RefreshPageState extends State<RefreshPage> {
  double size = 0;
  double maxSize = 120;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildRefreshHeader(), buildTestContent()],
    );
  }

  Container buildRefreshHeader() {
    return Container(
      height: size,
      //背景装饰
      color: Colors.white,
      child: Transform.translate(
        offset: Offset(100, 0 - (maxSize - size)),
        child: buildRefreshText(),
      ),
    );
  }

  Row buildRefreshText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage("images/ic_arrow_down.png"),
          width: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 20),
        ),
        Text(
          "下拉加载更多",
          style: TextStyle(
              fontSize: 13.0,
              color: Colors.lightBlue,
              decoration: TextDecoration.none),
        )
      ],
    );
  }

  Widget buildTestContent() {
    return Expanded(
      child: Listener(
        child: Column(
          children: <Widget>[buildExpanded(1)],
        ),
        onPointerMove: (event) {
          setState(() {
//            event.delta.direction;
            size += event.delta.dy;
            size = size > maxSize ? maxSize : (size < 0 ? 0 : size);
          });
        },
      ),
    );
  }

  Widget buildExpanded(int flex) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Text("AAA"),
      ),
    );
  }
}
