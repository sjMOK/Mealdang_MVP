import 'package:flutter/material.dart';
import '../style/font.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/reviewBoxContainer_reviewPage.dart';


class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _height = size.height;
    final _width = size.width;
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            // widget.datas["rating"],
                            "3",
                            style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA,
                              fontSize: 50,
                            ),
                          ),
                          RatingBarIndicator(
                            rating: 3,
                            // double.parse(widget.datas["rating"]),
                            itemPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: _height * 0.032,
                          ),
                        ],
                      ),
                      SizedBox(width: _width * 0.08),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: 100,
                            color: Colors.amber[700],
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(width: _width * 0.08),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("5점  "),
                              reviewScoreBox(context),
                            ],
                          ),
                          SizedBox(
                            height: _height * 0.016,
                          ),
                          Row(
                            children: [
                              Text("4점  "),
                              reviewScoreBox(context),
                            ],
                          ),
                          SizedBox(
                            height: _height * 0.016,
                          ),
                          Row(
                            children: [
                              Text("3점  "),
                              reviewScoreBox(context),
                            ],
                          ),
                          SizedBox(
                            height: _height * 0.016,
                          ),
                          Row(
                            children: [
                              Text("2점  "),
                              reviewScoreBox(context),
                            ],
                          ),
                          SizedBox(
                            height: _height * 0.016,
                          ),
                          Row(
                            children: [
                              Text("1점  "),
                              reviewScoreBox(context),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: _height*0.03,
                    color: Colors.grey[300],
                    thickness: 2.0,
                  ),
                  Container(
                    width: _width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("입맛 선택 !"),
                        dropdownButton(),
                        dropdownButton(),
                        dropdownButton(),
                      ],
                    ),
                  ),
                  Divider(
                    height: _height*0.03,
                    color: Colors.grey[300],
                    thickness: 2.0,
                  ),
                  Column(
                    children: [
                      //리뷰 작성된 것들 들어가는 곳
                      ReviewBox2(),
                      Divider(
                        color: Colors.grey,
                        thickness: 3,
                      ),
                      ReviewBox2(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  DropdownButton dropdownButton() {
    String valueChoose;
    List listItem = ["Item 1", "Item 2", "Item 3"];
    return DropdownButton(
      hint: Text("입맛 !"),
      value: valueChoose,
      onChanged: (newValue) {
        setState(() {
          valueChoose = newValue;
        });
      },
      items: listItem.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}

Widget reviewScoreBox(BuildContext context) {
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
