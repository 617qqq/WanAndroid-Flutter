import 'package:flutter/material.dart';

class StaggerAnimationWeight extends StatelessWidget {
  final AnimationController controller;
  Animation padding;
  Animation color;
  Animation height;

  StaggerAnimationWeight({Key key, this.controller}) : super(key: key) {
    height = new Tween(
      begin: 100.0,
      end: 300.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(.0, 0.6, curve: Curves.ease)));

    color = new ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    padding = new Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: padding.value),
      child: Container(
        height: height.value,
        width: 50,
        color: color.value,
      ),
    );
  }
}

class StaggerAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerAnimationState();
  }
}

class StaggerAnimationState extends State<StaggerAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          //调用我们定义的交错动画Widget
          child: StaggerAnimationWeight(controller: _controller),
        ),
      ),
    );
  }
}
