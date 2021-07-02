import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/page/categoryItem.dart';
import 'package:mealdang_mvp/data/categoryData.dart';
import 'package:sqflite/sqflite.dart';

class Category extends StatefulWidget {
  final Future<Database> database;
  Category(this.database);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
    print(_height.toString() + "높이");
    print(_size.width.toString() + "넓이");
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60.w),
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _catergoryContainer('koreanFood'),
                _catergoryContainer('chineseFood'),
                _catergoryContainer('japaneseFood'),
              ],
            ),
            SizedBox(
              height: 136.h,
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
                width: 60.w,
                height: 60.h,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryItem(widget.database, categoryName),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            categoryData[categoryName]['name'], // 카테고리 이름
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
              fontSize: 30.sp,
            ),
          ),
        ],
      ),
    );
  }
}