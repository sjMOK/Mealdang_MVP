import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/page/categoryItem.dart';
import 'package:mealdang_mvp/data/categoryData.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  double _height;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    _height = _size.height;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 40.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _catergoryContainer('koreanFood'),
                _catergoryContainer('chineseFood'),
                _catergoryContainer('japaneseFood'),
              ],
            ),
            SizedBox(
              height: _height * 0.08,
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
      child: Card(
        elevation: 0.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategoryItem(categoryName),
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                categoryData[categoryName]['img_path'],
                width: 95.w,
                height: 95.w,
              ),
              SizedBox(height: 20.h),
              Text(
                categoryData[categoryName]['name'],
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
