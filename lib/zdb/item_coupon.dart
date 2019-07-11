import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Welcome to Flutter",
        theme: new ThemeData(
            primaryColor: Colors.grey, canvasColor: Colors.white, primaryColorLight: Colors.white),
        home: Column(
          children: <Widget>[
            Text("4"),
            Container(
              child: ItemCouponPage(),
              color: Colors.white,
            )
          ],
        ));
  }
}

class ItemCouponPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ItemCouponState();
  }
}

class ItemCouponState extends State<ItemCouponPage> {
  double rWidth;

  @override
  Widget build(BuildContext context) {
    rWidth = MediaQuery.of(context).size.width / 372;
    return Stack(
      children: <Widget>[
        //底层边框
        Padding(
          padding: EdgeInsets.only(left: rWidth * 2.5),
          child: Image(
            image: AssetImage("images/bg_rect_shadow.png"),
            width: rWidth * 368,
            fit: BoxFit.fill,
            height: rWidth * 190,
          ),
        ),
        //优惠券边框
        Positioned(
          top: rWidth * 15,
          left: rWidth * 15,
          child: Image(
            image: AssetImage("images/bg_rect_shadow.png"),
            width: rWidth * 350,
            fit: BoxFit.fill,
            height: rWidth * 130,
          ),
        ),
        //优惠券图片
        Positioned(
          top: rWidth * 19,
          left: rWidth * 21,
          child: Image(
            image: AssetImage("images/bg_coupon_send_default.png"),
            width: rWidth * 228,
            fit: BoxFit.fill,
            height: rWidth * 119,
          ),
        ),
        //优惠券信息
        Positioned(
          top: rWidth * 19,
          left: rWidth * 253,
          child: Container(
            width: rWidth * 106,
            height: rWidth * 120,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/bg_rect_10_shadow_yellow.png"))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //商户名
                Padding(
                  padding: EdgeInsets.fromLTRB(2, rWidth * 9, 2, rWidth * 6),
                  child: Text(
                    "东菱智能店",
                    style: TextStyle(
                      inherit: false,
                      color: Color.fromRGBO(51, 51, 51, 100),
                      fontSize: rWidth * 12,
                    ),
                  ),
                ),
                //价格
                Container(
                  width: rWidth * 96,
                  height: rWidth * 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text("￥",
                          style: TextStyle(
                            inherit: false,
                            color: Color.fromRGBO(220, 84, 68, 100),
                            fontSize: rWidth * 12,
                          )),
                      Text("100",
                          style: TextStyle(
                              inherit: false,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 0, 0, 100),
                              fontSize: rWidth * 33,
                              shadows: [
                                Shadow(
                                    color: Color.fromRGBO(0, 0, 0, 100),
                                    offset: Offset(0, 1),
                                    blurRadius: 3)
                              ])),
                    ],
                  ),
                ),
                //券类型
                Container(
                  width: rWidth * 50,
                  height: rWidth * 19,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(149, 52, 43, 100), width: rWidth),
                    borderRadius: BorderRadius.all(Radius.circular(rWidth * 10)),
                  )),
                  padding: EdgeInsets.only(top: rWidth * 2),
                  child: Text(
                    "商品券",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        inherit: false,
                        fontSize: rWidth * 9,
                        color: Color.fromRGBO(149, 52, 43, 100)),
                  ),
                ),
                //有效期
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  child: Text(
                    "有效期：2018.8.30",
                    style: TextStyle(
                      inherit: false,
                      color: Color(0xFFB79572),
                      fontSize: rWidth * 7,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //优惠券醒目标志
        Positioned(
          top: rWidth * 11,
          left: rWidth * 13,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/ic_coupon_attractive.png"))),
            width: rWidth * 83,
            height: rWidth * 72,
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage("images/ic_arrow_down_shadow.png"),
                  width: rWidth * 42,
                  height: rWidth * 33,
                ),
                Text("20%",
                    style:
                        TextStyle(color: Color(0xFFFD9423), fontSize: rWidth * 17, inherit: false))
              ],
            ),
          ),
        ),
        //浏览次数
        Positioned(
          top: rWidth * 118,
          left: rWidth * 204,
          child: Container(
            width: rWidth * 65,
            height: rWidth * 17,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/ic_coupon_msg_3.png"))),
            padding: EdgeInsets.only(left: rWidth * 17),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage("images/ic_see_white.png"),
                  width: rWidth * 10,
                  height: rWidth * 10,
                ),
                Text("200次",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: rWidth * 8,
                        inherit: false,
                        shadows: [
                          Shadow(
                              color: Color.fromRGBO(0, 0, 0, 100),
                              offset: Offset(0, 1),
                              blurRadius: 3)
                        ]))
              ],
            ),
          ),
        ),
        //优惠券状态
        Positioned(
          child: Image(
            image: AssetImage("images/ic_status_used.png"),
            width: rWidth * 84,
            height: rWidth * 32,
          ),
          bottom: rWidth * 15,
        )
      ],
    );
  }
}
