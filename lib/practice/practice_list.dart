import 'package:flutter/material.dart';
import 'package:wanAndroid/pages/build_page.dart';

import 'animation_hero.dart';
import 'animation_stagger.dart';
import 'chat_page.dart';

class PracticeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PracticeListPageState();
  }
}

class PracticeListPageState extends State<PracticeListPage> {
  List page = new List();

  int downIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page.add(HeroAnimationRoute);
    page.add(StaggerAnimationDemo);
    page.add(ChatPage);
    page.add(BuildPage);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: page.length,
        itemBuilder: (BuildContext context, int index) {
          return buildItem(index);
        });
  }

  Widget buildItem(int index) {
    return Listener(
      child: Container(
        color: downIndex == index ? Colors.grey : Colors.white,
        child: Text(page[index].toString()),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => downIndex = index),
      onPointerUp: (PointerUpEvent event) {
        if (index == downIndex) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            switch (index) {
              case 0:
                return HeroAnimationRoute();
              case 1:
                return StaggerAnimationDemo();
              case 2:
                return ChatPage();
              default:
                return BuildPage();
            }
          }));
        }
      },
    );
  }
}
