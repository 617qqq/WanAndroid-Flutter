import 'package:flutter/material.dart';
import 'package:wanAndroid/pages/build_page.dart';

import 'animation_hero.dart';
import 'animation_stagger.dart';

class PracticeListTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PracticeListTestPageState();
  }
}

class PracticeListTestPageState extends State<PracticeListTestPage> {
  List page = new List();

  int downIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page.add(BuildPage);
    page.add(HeroAnimationRoute);
    page.add(StaggerAnimationWeight);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
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
            return page[index];
          }));
        }
      },
    );
  }

  Widget buildItemTest(int index) {
    return Container(
      color: downIndex == index ? Colors.grey : Colors.white,
      child: Text(index.toString()),
    );
  }
}
