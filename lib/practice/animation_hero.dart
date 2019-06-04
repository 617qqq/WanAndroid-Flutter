import 'package:flutter/material.dart';

const HERO_TAG = "avatar";

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image = Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/bg.png'),
      ),
    );

    return Container(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        child: Hero(
          tag: HERO_TAG,
          child: image,
        ),
        onTap: ()=> gotoB(context),
      ),
    );
  }

  void gotoB(BuildContext context) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return new FadeTransition(
        opacity: animation,
        child: Scaffold(
          body: HeroAnimationRouteB(),
        ),
      );
    }));
  }

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      alignment: Alignment.topCenter,
//      child: InkWell(
//        child: Hero(
//            tag: "avatar",
//            child: ClipOval(
//              child: Image.asset("images/bg.png", width: 50,),
//            )
//        ),
//        onTap: () {
//          Navigator.push(context, PageRouteBuilder(pageBuilder:
//              (BuildContext context, Animation animation,
//                  Animation sAnimation) {
//            return new FadeTransition(
//              opacity: animation,
//              child: Scaffold(
//                body: HeroAnimationRouteB(),
//              ),
//            );
//          }));
//        },
//      ),
//    );
//  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hero = Hero(tag: HERO_TAG, child: Image.asset("images/bg.png"));
    var row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("AAA")
        ],
      );
    return ListView(children: <Widget>[
      row,
      hero
    ],);
  }
}
