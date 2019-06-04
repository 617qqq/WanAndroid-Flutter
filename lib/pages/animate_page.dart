import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AnimatePageState();
  }
}

class AnimatePageState extends State<AnimatePage> 
        with SingleTickerProviderStateMixin
{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
        ..addListener((){
          setState(() {
            
          });
        });

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
       controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Image.asset("images/ic_launcher_round.png"
        ,width: animation.value
        ,height: animation.value,),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
