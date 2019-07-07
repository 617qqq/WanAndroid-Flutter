import 'package:flutter/material.dart';

class BuildPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BuildPageState();
  }
}

class BuildPageState extends State<BuildPage> {
  Row row = new Row();

  List tag = [
    "位移",
    "爆发",
    "先锋",
    "重装",
    "狙击",
    "术士",
    "远程位",
    "辅助",
    "输出",
    "生存",
    "群攻",
    "男性",
    "防护",
    "快速复活",
    "支援",
    "近卫",
    "削弱",
    "近战位",
    "治疗",
    "召唤",
    "近战",
    "医疗",
    "减速",
    "特种",
    "远程",
    "控场"
  ];

  String doubleTags = "近战位+男性:角峰(4星)近战位+治疗:古米(4星)、临光(5星)近战位+支援:杜宾(4星)、凛冬(5星)近战位+群攻:艾丝黛尔(4星)、幽灵鲨(5星)近战位+减速:霜叶(4星)、食铁兽(5星)近战位+控场:德克萨斯(5星)、红(5星)\n" +
      "远程位+生存:杰西卡(4星)远程位+支援:白面鹗(5星)、华法琳(5星)远程位+控场:梅尔(5星)\n" +
      "输出+防护:雷蛇(5星)输出+重装:雷蛇(5星)输出+辅助:真理(5星)输出+特种:狮蝎(5星)、崖心(5星)输出+支援:杜宾(4星)输出+削弱:夜烟(4星)、流星(4星)输出+减速:霜叶(4星)、真理(5星)输出+位移:崖心(5星)\n" +
      "防护+特种:砾(4星)防护+男性:角峰(4星)防护+治疗:古米(4星)、临光(5星)防护+位移:可颂(5星)防护+输出:雷蛇(5星)、火神(5星)防护+特种:砾(4星)防护+生存:火神(5星)\n" +
      "生存+远程:杰西卡(4星)生存+狙击:杰西卡(4星)生存+群攻:艾丝黨尔(4星)、幽灵鲨(5星)生存+特种:狮蝎(5星)\n" +
      "治疗+重装:古米(4星)、临光(5星)治疗+近战:古米(4星)、临光(5星)治疗+防护:古米(4星)、临光(5星)治疗+支援:白面鹗(5星)、华法琳(5星)\n" +
      "支援+先锋:凛冬(5星)支援+近卫:杜宾(4星)支援+医疗:白面鹗(5星)、华法琳(5星)支援+治疗:白面鹗(5星)、华法琳(5星)支援+近战:杜宾(4星)、凛冬(5星)支援+远程:白面鹗(5星)、华法琳(5星)支援+输出:杜宾(4星)" +
      "快速复活+控场:红(5星)快速复活+防护:砾(4星)\n" +
      "群攻+狙击:白雪(4星)、陽星(5星)群攻+近卫:艾丝黨尔(4星)、幽灵鲨(5星)群攻+近战:艾丝黛尔(4星)、幽灵鲨(5星)群攻+生存:艾丝黨尔(4星)、幽灵鲨(5星)群攻+削弱:陨星(5星)群攻+减速:白雪(4星)\n" +
      "削弱+狙击:流星(4星)、陨星(5星)削弱+术士:夜烟(4星)削弱+辅助:初雪(5星)削弱+输出:夜烟(4星)、流星(4星)削弱+群攻:陨星(5星)\n" +
      "减速+狙击:白雪(4星)减速+近卫:霜叶(4星)减速+特种:食铁兽(5星)减速+近战:霜叶(4星)、食铁兽(5星)减速+输出:霜叶(4星)、真理(5星)减速+群攻:白雪(4星)减速+位移:食铁兽(5星)\n" +
      "控场+先锋:德克萨斯(5星)控场+特种:红(5星)控场+辅助:梅尔(5星)控场+近战・德克萨斯(5星)、红(5星)控场+远程:梅尔(5星)控场+快速复活:红(5星)\n" +
      "位移+重装:可颂(5星)位移+特种:暗索(4星)、阿消(4星)、崖心(5星)、食铁兽(5星)位移+输出:崖心(5星)位移+防护:可颂(5星)位移+减速:食铁兽(5星)\n" +
      "狙击+群攻:白雪(4星)、陨星(5星)狙击+削弱:流星(4星)、陨星(5星)狙击+减速:白雪(4星)狙击+爆发:守林人(5星)狙击+生存:杰西卡(4星)\n" +
      "术士+削弱:夜烟(4星)\n" +
      "先锋+支援:凛冬(5星)先锋+控场:德克萨斯(5星)\n" +
      "近卫+减速:霜叶(4星)近卫+支援:杜宾(4星)近卫+群攻:艾丝黨尔(4星)、幽灵鲨(5星)\n" +
      "重装+治疗:古米(4星)、临光(5星)重装+男性:角峰(4星)重装+位移:可颂(5星)重装+输出:雷蛇(5星)、火神(5星)重装+生存:火神(5星)\n" +
      "医疗+支援:白面鹗(5星)、华法琳(5星)\n" +
      "辅助+削弱:初雪(5星)辅助+输出:真理(5星)辅助+控场:梅尔(5星)\n" +
      "特种+输出:狮蝎(5星)、崖心(5星)特种+防护:砾(4星)特种+生存:狮蝎(5星)特种+减速:食铁兽(5星)特种+控场:红(5星)特种+位移:暗索(4星)、阿消(4星)、崖心(5星)、食铁兽(5星)";

  String singleTags = "特种:砾(4星)、暗索(4星)、阿消(4星)、红(5星)、狮蝎(5星)、崖心(5星)、食铁兽(5星)" +
      "爆发:守林人(5星)" +
      "位移:暗索(4星)、阿消(4星)、崖心(5星)、食铁兽(5星)、可颂(5星)" +
      "控场:德克萨斯(5星)、红(5星)、梅尔(5星)" +
      "召唤:梅尔(5星)" +
      "削弱:夜烟(4星)、流星(4星)、初雪(5星)、陨星(5星)" +
      "支援:杜宾(4星)、白面鹗(5星)、华法琳(5星)、凛冬(5星)" +
      "快速复活:砾(4星)、红(5星)";
  Map<String, String> data = new Map();
  List<String> tags = new List();
  Set<int> selected = new Set();

  @override
  void initState() {
    super.initState();
    String all = doubleTags + singleTags;
    all.replaceAll("\n", "");
    tags = extractTag(all);
    List<String> members = extractMember(all);
    for (int i = 0; i < tags.length; i++) {
      data[tags[i]] = members[i];
    }
  }

  List<String> extractTag(String target) {
    List<String> colon = target.split(":");
    List<String> tags = new List();
    for (var i = 0; i < colon.length; i++) {
      if (i != colon.length - 1) {
        String temp = colon[i];
        if (temp.contains(")")) {
          tags.add(temp.substring(temp.lastIndexOf(")") + 1));
        } else {
          print(temp);
        }
      }
    }
    return tags;
  }

  List<String> extractMember(String colon) {
    List<String> colonArray = colon.split(":");
    List<String> members = new List();
    for (int i = 1; i < colonArray.length; i++) {
      String temp = colonArray[i];
      if (temp.contains(")")) {
        members.add(temp.substring(0, temp.lastIndexOf(")") + 1));
      } else {
        print(temp);
      }
    }
    return members;
  }

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('登录'),
//      ),
//      body: Padding(
//        padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 0.0),
//        child: ListView(
//          children: _buildRow(),
//          physics: new BouncingScrollPhysics(),
//        ),
//      ),
//    );
  return buildTest();
  }
  
  /// 测试ListView.Builder
  Widget buildTest(){
    return ListView.builder(itemBuilder: (BuildContext buildContext, int index){
      return  Container(
        color: Colors.white,
        child: Text(index.toString()),
      );
    });
  }

  _buildRow() {
    List widgets = <Widget>[];
    for (int i = 0; i < tag.length; i++) {
//      widgets.add(_buildSubRow(i));
      widgets.add(GestureDetector(
        child: _buildSubButton(i),
        onTap: (){
          setState(() {
            if (selected.contains(i)) {
              selected.remove(i);
            } else {
              selected.add(i);
            }
          });
        },
      ));
    }
    return widgets;
  }

  Container _buildSubButton(int i) {
    bool isSelected = selected.contains(i);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
      decoration: BoxDecoration(
        gradient: isSelected ? _getSelectedGradient() : _getUnSelectedGradient(),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
          )
        ]
      ),
      alignment: Alignment.center,
      child: Text(
        tag[i], style: TextStyle(color: isSelected ? Colors.black : Colors.white),
      ),
    );
  }

  _onClickItem(int i) {
    setState(() {
      if (selected.contains(i)) {
        selected.remove(i);
      } else {
        selected.add(i);
      }
    });
  }

  GestureDetector _buildSubRow(int i) {
    bool isSelected = selected.contains(i);
    var button = new Text(tag[i],
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.grey,
          background: new Paint()
            ..color = (isSelected ? Colors.white : Colors.black),
        ));
    return GestureDetector(
      child: button,
      onTap: () {
        setState(() {
          print("aaaaaaaaaaaaaaaaaaaa");
          if (selected.contains(i)) {
            selected.remove(i);
          } else {
            selected.add(i);
          }
        });
      },
    );
  }

  _getUnSelectedGradient() {
    return RadialGradient(
      colors: [Colors.grey, Colors.grey]
    );
  }

  _getSelectedGradient() {
    return RadialGradient(
      colors: [Colors.blueAccent, Colors.lightBlueAccent],
      center: Alignment.center,
      radius: .10
    );
  }

//ListView用button点击会怎样
}
