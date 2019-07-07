import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChatPageState();
  }
}

class ChatPageState extends State<ChatPage> {

  List page = new List();

  int downIndex = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Widget buildItem(int index){
    return Listener(
      child: Container(),
      onPointerDown: (PointerDownEvent event) => setState(() => downIndex = index),
    );
  }
}
