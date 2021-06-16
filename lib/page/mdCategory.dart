import 'package:flutter/material.dart';
import 'package:mealdang_mvp/page/mdListview.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/data/categoryData.dart';
import 'package:sqflite/sqflite.dart';

class MealdangCategory extends StatefulWidget {
  final Future<Database> database;
  MealdangCategory(this.database);

  @override
  _MealdangCategoryState createState() => _MealdangCategoryState();
}

class _MealdangCategoryState extends State<MealdangCategory> {
  @override
  void initState() {
    super.initState();
    print('Category initState()');
  }

  void dispose() {
    print('Category dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height;
    return Container(
      child: Padding(
        padding: //EdgeInsets.symmetric(vertical: 40, horizontal: 60),
            EdgeInsets.symmetric(vertical: 0, horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: _height * 0.18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _catergoryContainer('koreanFood'),
                _catergoryContainer('chineseFood'),
                _catergoryContainer('japaneseFood'),
              ],
            ),
            SizedBox(
              height: _height * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _catergoryContainer('westernFood'),
                _catergoryContainer('lateNightFood'),
                _catergoryContainer('snackFood'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _catergoryContainer(String categoryName) {
    return Container(
      child: Column(
        children: [
          Transform.scale(
            scale: 3,
            child: IconButton(
              icon: Image.asset(
                categoryData[categoryName]['img_path'], // 아이콘 이미지 경로
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MealdangListview(widget.database, categoryName),
                  ),
                );
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
