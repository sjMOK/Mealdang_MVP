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
  List<int> filter = [4, 4, 4];
  List selected = ["전체", "전체", "전체"];
  List listSpicy = ["맵아이콘1", "맵아이콘x2", "맵아이콘x3", "전체"];
  List listSalty = ["짠아이콘1", "짠아이콘x2", "짠아이콘x3", "전체"];
  List listSweety = ["단아이콘1", "단아이콘x2", "단아이콘x3", "전체"];

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
                  DropdownButton(
                    value: selected[0],
                    onChanged: (var values) {
                      setState(() {
                        selected[0] = values;
                        filter[0] = listSpicy.indexOf(values) + 1;
                      });
                    },
                    items: listSpicy.map(
                      (var value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(width: _width * 0.05),
                  DropdownButton(
                    value: selected[1],
                    onChanged: (var values) {
                      setState(() {
                        selected[1] = values;
                        filter[1] = listSalty.indexOf(values) + 1;
                      });
                    },
                    items: listSalty.map(
                      (var value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(width: _width * 0.05),
                  DropdownButton(
                    value: selected[2],
                    onChanged: (var values) {
                      setState(() {
                        selected[2] = values;
                        filter[2] = listSweety.indexOf(values) + 1;
                      });
                    },
                    items: listSweety.map(
                      (var value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
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

  DropdownButton dropdownButton(
      var tasty, List<int> score, List listItem, String selectedItem) {
    return DropdownButton(
      value: selectedItem,
      onChanged: (var values) {
        setState(() {
          selectedItem = values;
          switch (tasty) {
            case 'spicy':
              score[0] = listItem.indexOf(values) + 1;
              break;
            case 'salty':
              score[1] = listItem.indexOf(values) + 1;
              break;
            case 'sweety':
              score[2] = listItem.indexOf(values) + 1;
          }
        });
        print(selectedItem + "이거로 바뀌어야함");
        print(score);
      },
      items: listItem.map(
        (var value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
