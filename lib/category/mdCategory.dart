import 'package:flutter/material.dart';
import 'package:mealdang_mvp/food_listview/mdListview.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/category/categoryData.dart';
import 'package:sqflite/sqflite.dart';

class MealdangCategory extends StatefulWidget {
  //MealdangCategory({Key key}) : super(key: key);
  final Future<Database> db;
  MealdangCategory(this.db);

  @override
  _MealdangCategoryState createState() => _MealdangCategoryState();
}

class _MealdangCategoryState extends State<MealdangCategory> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('밀당',
            style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 38)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
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
              SizedBox(height: _height * 0.18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _catergoryContainer(context, 'koreanFood'),
                  _catergoryContainer(context, 'chineseFood'),
                  _catergoryContainer(context, 'japaneseFood'),
                ],
              ),
              SizedBox(
                height: _height * 0.2,
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

  Container _catergoryContainer(BuildContext context, String categoryName) {
    return Container(
      child: Column(
        children: [
          Transform.scale(
            scale: 3,
            child: IconButton(
              icon: Image.asset(
                categoryData[categoryName]['path'], // 아이콘 이미지 경로
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MealdangListview(categoryName, widget.db)));
              },
            ),
          ),
          SizedBox(height: 30),
          Text(
            categoryData[categoryName]['name'], // 카테고리 이름
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
