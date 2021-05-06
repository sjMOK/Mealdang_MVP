import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MealdangListview.dart';
import 'style/font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealdangMVP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MealdangListview(),
    );
  }
}

class MealdangCategory extends StatefulWidget {
  @override
  _MealdangCategoryState createState() => _MealdangCategoryState();
}

class _MealdangCategoryState extends State<MealdangCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('밀당',
            style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 38)),
        backgroundColor: Colors.amber[400],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                  child: Text("밀키트 카테고리 선택",
                      style: TextStyle(
                          fontFamily: MyFontFamily.BMJUA, fontSize: 20))),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: 3,
                          child: IconButton(
                              icon: Image.asset(
                                'images/KoreanFood_icon/bibimbap.png',
                              ),
                              onPressed: () {}),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('한식',
                            style: TextStyle(
                                fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset(
                              'images/ChineseFood_icon/jajangmyeon.png',
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('중식',
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset(
                              'images/JapaneseFood_icon/sushi.png',
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('일식',
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 140,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset(
                              'images/WesternFood_icon/steak.png',
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('양식',
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset(
                              'images/LateNightMeal_icon/chicken.png',
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('야식',
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                    ],
                  )),
                  Container(
                      child: Column(
                    children: [
                      Transform.scale(
                        scale: 3,
                        child: IconButton(
                            icon: Image.asset(
                              'images/CarbSnack_icon/tteokbokki.png',
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('분식',
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA, fontSize: 30)),
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

