import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:sqflite/sqlite_api.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/page/reviewListview.dart';

class ReviewPage extends StatefulWidget {
  final Future<Database> database;
  Product product;
  Widget ratingContainer;
  Future<List<Review>> _review;
  ReviewPage(this.database, this.product, this.ratingContainer, this._review);
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
          widget.product.name + " 리뷰",
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
                          ReviewListview(widget.database, widget.product.id,
                              widget._review, filter);
                        });
                      },
                      child: Text("적용"))
                ],
              ),
            ),
            ReviewListview(
                widget.database, widget.product.id, widget._review, filter),
          ],
        ),
      ),
    );
  }

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

  DropdownButton dropdownButton(var tasty, List<int> score) {
    var valueChoose;
    List listItem;
    if (tasty == "spicy")
      listItem = ["맵아이콘x1", "아이콘x2", "아이콘x3", "전체"];
    else if (tasty == "salty")
      listItem = ["짠아이콘x1", "아이콘x2", "아이콘x3", "전체"];
    else
      listItem = ["단아이콘x1", "아이콘x2", "아이콘x3", "전체"];
    return DropdownButton(
      hint: Text("$tasty"),
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
        setState(() {
          valueChoose = "${listItem[listItem.indexOf(value)]}";
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
        });
        print(valueChoose + "이거로 바뀌어야함");
        print(score);
      },
    );
  }
}
