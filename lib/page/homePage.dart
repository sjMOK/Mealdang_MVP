import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  Future<Database> database;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  double _width;
  double _height;
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);
    _width = _media.size.width;
    _height = _media.size.height;
    return _scroll(context);
  }

  void _onItemTapped(Product product) {
    print('search tapped');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetail(widget.database, product),
      ),
    );
    return;
  }

  SingleChildScrollView _scroll(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: _height * 0.25,
            child: topContents(context),
          ),
          SizedBox(
            height: _height * 0.03,
          ),
          Container(
            padding: EdgeInsets.all(_height * 0.02),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "XX들이 많이 먹는 제품들 나도 먹어봐야겠죠?",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: MyFontFamily.BMJUA,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              height: _height * 0.2,
                              child: Image.asset(
                                "assets/images/food_pictures/korean_food/KoreanFood_1.jpeg",
                                width: _width * 0.28,
                                height: _height * 0.28,
                              ),
                            ),
                            Text("음식이름"),
                            Text("가격"),
                          ],
                        ),
                        //onTap: _onItemTapped(),
                      ),
                      SizedBox(width: _width * 0.04),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(_height * 0.02),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "가장 많이 할인하고 있는 제품들을 보여드릴게요",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: MyFontFamily.BMJUA,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              height: _height * 0.2,
                              child: Image.asset(
                                "assets/images/food_pictures/korean_food/KoreanFood_1.jpeg",
                                width: _width * 0.28,
                                height: _height * 0.28,
                              ),
                            ),
                            Text("음식이름"),
                            Text("가격"),
                          ],
                        ),
                      ),
                      SizedBox(width: _width * 0.04),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(_height * 0.02),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "밀당이 추천하는 제품들을 보여드릴게요",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: MyFontFamily.BMJUA,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            Container(
                              height: _height * 0.2,
                              child: Image.asset(
                                "assets/images/food_pictures/korean_food/KoreanFood_1.jpeg",
                                width: _width * 0.28,
                                height: _height * 0.28,
                              ),
                            ),
                            Text("음식이름"),
                            Text("가격"),
                          ],
                        ),
                        //onTap: () => _onItemTapped(),
                      ),
                      SizedBox(width: _width * 0.04),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder recommendProduct() {
    return FutureBuilder(
      //future:
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container();
        }
      },
    );
  }

  Widget topContents(BuildContext context) {
    final List<String> images = <String>[
      "assets/images/food_pictures/korean_food/KoreanFood_1.jpeg",
      "assets/images/food_pictures/korean_food/KoreanFood_2.jpeg",
      "assets/images/food_pictures/korean_food/KoreanFood_3.jpeg"
    ];
    return PageView.builder(
      controller: PageController(
        initialPage: images.length,
        viewportFraction: 1.0,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: Image.asset(images[index]));
      },
    );
  }
}
