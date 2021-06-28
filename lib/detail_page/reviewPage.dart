import 'package:flutter/material.dart';
import 'package:mealdang_mvp/db.dart';
import 'package:mealdang_mvp/food_listview/product.dart';
import 'package:mealdang_mvp/food_listview/review.dart';
import 'package:sqflite/sqlite_api.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/reviewListview.dart';

class ReviewPage extends StatefulWidget {
  final Future<Database> database;
  int id;
  Widget ratingContainer;
  Future<List<Review>> _review;
  ReviewPage(this.database, this.id, this.ratingContainer, this._review);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _width;
  double _height;
  List<int> filter = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _height = size.height;
    _width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        centerTitle: true,
        title: Text(
          "상품 이름 리뷰",
          style: TextStyle(
              fontFamily: MyFontFamily.BMJUA,
              fontSize: 22,
              color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _scorll(widget.ratingContainer),
    );
  }

  SingleChildScrollView _scorll(Widget ratingContainer) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Divider(
              color: Colors.grey[300],
              thickness: 2.0,
            ),
            SizedBox(height: _height * 0.03),
            ratingContainer,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dropdownButton("spicy", filter),
                  dropdownButton("salty", filter),
                  dropdownButton("sweety", filter),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          ReviewListview(widget.database, widget.id,
                              widget._review, filter);
                        });
                      },
                      child: Text("적용"))
                ],
              ),
            ),
            ReviewListview(widget.database, widget.id, widget._review, filter),
          ],
        ),
      ),
    );
  }

  // DropdownButton dropdownButton() {
  //   String valueChoose;
  //   List listItem = ["Item 1", "Item 2", "Item 3"];
  //   return DropdownButton(
  //     hint: Text("입맛 !"),
  //     value: valueChoose,
  //     onChanged: (newValue) {
  //       setState(() {
  //         valueChoose = newValue;
  //       });
  //     },
  //     items: listItem.map((valueItem) {
  //       return DropdownMenuItem(
  //         value: valueItem,
  //         child: Text(valueItem),
  //       );
  //     }).toList(),
  //   );
  // }

  Widget reviewScoreBox() {
    return Stack(
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          width: 100,
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: Colors.amber),
          width: 100 * 0.2,
          height: 15,
        ),
      ],
    );
  }
}

DropdownButton dropdownButton(String tasty, List<int> score) {
  var valueChoose;
  List listItem;
  if (tasty == "spicy")
    listItem = ["아이콘x1", "아이콘x2", "아이콘x3", "전체"];
  else if (tasty == "salty")
    listItem = ["아이콘x1", "짠아이콘x2", "아이콘x3", "전체"];
  else
    listItem = ["아이콘x1", "아이콘x2", "아이콘x3", "전체"];
  return DropdownButton(
      hint: Text(tasty),
      value: valueChoose,
      items: listItem.map(
        (valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        },
      ).toList(),
      onChanged: (value) {
        switch (tasty) {
          case 'spicy':
            score[0] = listItem.indexOf(value) + 1;
            break;
          case 'salty':
            score[1] = listItem.indexOf(value) + 1;
            break;
          case 'sweety':
            score[2] = listItem.indexOf(value) + 1;
        }
        print(score);
      });
}
