import 'package:flutter/material.dart';
import 'package:wanAndroid/constant/constants.dart';
import 'package:wanAndroid/event/login_event.dart';

import 'package:wanAndroid/pages/about_us_page.dart';
import 'package:wanAndroid/pages/collect_list_page.dart';
import 'package:wanAndroid/pages/login_page.dart';
import 'package:wanAndroid/pages/refresh_page.dart';
import 'package:wanAndroid/pages/animate_page.dart';
import 'package:wanAndroid/practice/animation_hero.dart';
import 'package:wanAndroid/practice/animation_stagger.dart';
import 'package:wanAndroid/practice/practice_list.dart';
import 'package:wanAndroid/practice/practice_list_test.dart';
import 'package:wanAndroid/util/DataUtils.dart';
import 'build_page.dart';

class MyInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage> with WidgetsBindingObserver {
  String userName;

  @override
  void initState() {
    super.initState();

    _getName();

    Constants.eventBus.on<LoginEvent>().listen((event) {
      _getName();
    });
  }

  void _getName() async {
    DataUtils.getUserName().then((username) {
      setState(() {
        userName = username;
        print('name:' + userName.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    Widget image = Center(
//      child: Container(
//          width: 100,
//          height: 100,
//          decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              image: DecorationImage(image: AssetImage('images/bg.png')))),
//    );
    Widget image = Center(
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/bg.png'),
      ),
    );

    Widget raisedButton = RaisedButton(
      child: Text(
        userName == null ? "请登录" : userName,
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).accentColor,
      onPressed: () async {
        //登录

        await DataUtils.isLogin().then((isLogin) {
          if (!isLogin) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PracticeListPage();
//              return BuildPage();
            }));
//            Navigator.of(context).push(PageRouteBuilder(
//                transitionDuration: Duration(microseconds: 2000),
//                pageBuilder: (BuildContext context, Animation animation,
//                    Animation secondaryAnimation) {
//                  return new FadeTransition(
//                    opacity: animation,
////                    child: AnimatePage(),
//                    child: HeroAnimationRoute(),
//                  );
//                }));
          } else {
            print('已登录!');
          }
        });
      },
    );

    Widget listLike = ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('喜欢的文章'),
        trailing: Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () async {
          await DataUtils.isLogin().then((isLogin) {
            if (isLogin) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CollectPage();
              }));
            } else {
              print('已登录!');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            }
          });
        });

    Widget listAbout = ListTile(
        leading: const Icon(Icons.info),
        title: const Text('关于我们'),
        trailing: Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AboutUsPage();
          }));
        });

    Widget listLogout = ListTile(
        leading: const Icon(Icons.info),
        title: const Text('退出登录'),
        trailing: Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () async {
          DataUtils.clearLoginInfo();
          setState(() {
            userName = null;
          });
        });

    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        image,
        raisedButton,
        listLike,
        listAbout,
        listLogout,
      ],
    );
  }
}
