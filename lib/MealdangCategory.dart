import 'package:flutter/material.dart';
import 'style/font.dart';

class MealdangCategory extends StatefulWidget {
  MealdangCategory({Key key}) : super(key: key);
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
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.amber),),
            ListTile(
              title: Text('Item 1'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
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
                                'assets/images/Category_icon/KoreanFood_icon/bibimbap.png',
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/mealdangListview');
                              }),
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
                                  'assets/images/Category_icon/ChineseFood_icon/jajangmyeon.png',
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
                                  'assets/images/Category_icon/JapaneseFood_icon/sushi.png',
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
                                  'assets/images/Category_icon/WesternFood_icon/steak.png',
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
                                  'assets/images/Category_icon/LateNightMeal_icon/chicken.png',
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
                                  'assets/images/Category_icon/CarbSnack_icon/tteokbokki.png',
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
