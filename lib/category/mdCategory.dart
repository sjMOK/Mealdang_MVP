import 'package:flutter/material.dart';
import 'package:mealdang_mvp/food_listview/mdListview.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/category/categoryData.dart' as categories;

class MealdangCategory extends StatefulWidget {
  MealdangCategory({Key key}) : super(key: key);
  @override
  _MealdangCategoryState createState() => _MealdangCategoryState();
}

class _MealdangCategoryState extends State<MealdangCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.amber),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
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
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _catergoryContainer(context, 'koreanFood'),
                  _catergoryContainer(context, 'chineseFood'),
                  _catergoryContainer(context, 'japaneseFood'),
                ],
              ),
              SizedBox(
                height: 140,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _catergoryContainer(context, 'westernFood'),
                  _catergoryContainer(context, 'lateNightFood'),
                  _catergoryContainer(context, 'snackFood'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _catergoryContainer(BuildContext context, String categoryKey) {
    return Container(
      child: Column(
        children: [
          Transform.scale(
            scale: 3,
            child: IconButton(
              icon: Image.asset(
                categories.categoryData[categoryKey]['path'], // 아이콘 이미지 경로
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MealdangListview()));
              },
            ),
          ),
          SizedBox(height: 30),
          Text(
            categories.categoryData[categoryKey]['name'], // 카테고리 이름
            style: TextStyle(
              fontFamily: MyFontFamily.BMJUA,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
