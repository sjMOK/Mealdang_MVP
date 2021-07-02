import 'package:flutter/material.dart';
import 'package:mealdang_mvp/page/categoryItem.dart';
import 'package:mealdang_mvp/data/categoryData.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  double _width;
  double _height;
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
    _height = _size.height;
    _width = _size.width;

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
        child: Column(
          children: [
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
                width: _width * 0.2,
                height: _width * 0.2,
              ),
              SizedBox(height: 20),
              Text(
                categoryData[categoryName]['name'], 
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // child: Column(
    //   children: [
    //     Transform.scale(
    //       scale: 3,
    //       child: IconButton(
    //         icon: Image.asset(
    //           categoryData[categoryName]['img_path'], // 아이콘 이미지 경로
    //         ),
    //         onPressed: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (context) =>
    //                   CategoryItem(categoryName),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     SizedBox(height: 30),
    //     Text(
    //       categoryData[categoryName]['name'], // 카테고리 이름
    //       style: TextStyle(
    //         fontFamily: 'NotoSans',
    //         fontWeight: FontWeight.w700,
    //         fontSize: 30,
    //       ),
    //     ),
    //   ],
    // ),
  }
}
