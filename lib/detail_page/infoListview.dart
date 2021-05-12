import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoListView extends StatefulWidget {
  Map<String, String> datas;

  @override
  InfoListView(Map<String, String> data) {
    this.datas = data;
  }

  _InfoListViewState createState() => _InfoListViewState();
}

class _InfoListViewState extends State<InfoListView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _height = size.height;
    final _width = size.width;
    return Container(
<<<<<<< HEAD
      child: ListView.builder(
        itemBuilder: (context, int index) {
          return Container(
            child: Column(
              //사진이랑 음식 기본정보 들어가는 컨테이너
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Hero(
                              tag: widget.datas["cid"],
                              child: Image.asset(
                                widget.datas["image"],
                                width: width * 0.4, //150,
                                height: width * 0.4, //150
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 10,
                                width: width - 30, //350,
                                child: Divider(
                                  color: Colors.grey[300],
                                  thickness: 2.0,
                                )),
                            SizedBox(height: 6),
                            Container(
                              width: 400, //MediaQuery적용하기
                              child: Column(
                                children: [
                                  Text(widget.datas["title"],
                                      style: TextStyle(
                                        fontFamily: MyFontFamily.BMJUA,
                                        fontSize: 16,
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 20.0,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(widget.datas["rating"] + ' '),
                                          Text(
                                            "(" + widget.datas["review"] + "개)",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600]),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "/",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(_setPriceFormat(
                                              widget.datas["price"])),
                                          Text(
                                            " " + widget.datas["person"],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
                            SizedBox(height: 6),
                            Container(
                              height: 10,
                              width: 400,
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //별점이랑 점수 들어가는 컨테이너
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 400, //MediaQuery 적용하기
                            child: Row(
                              children: [
                                Text(
                                  "    리뷰  ",
                                  style: TextStyle(
                                    fontFamily: MyFontFamily.BMJUA,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  widget.datas["review"],
                                  style: TextStyle(
                                      fontFamily: MyFontFamily.BMJUA,
                                      fontSize: 20,
                                      color: Colors.amber[900]),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            height: 10,
                            width: 420,
=======
        child: ListView.builder(
      itemBuilder: (context, int index) {
        return Container(
            width: _width,
            child: Column(
              //사진이랑 음식 기본정보 들어가는 컨테이너
              children: <Widget>[
                Container(
                  width: _width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 12.0),
                          Hero(
                            tag: widget.datas["cid"],
                            child: Image.asset(
                              widget.datas["image"],
                              width: _width * 0.4, //150,
                              height: _width * 0.4, //150
                            ),
                          ),
                          SizedBox(height: _height * 0.013),
                          Container(
                            height: _height * 0.013,
                            width: _width - 20,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2.0,
                            ),
                          ),
                          SizedBox(height: _height * 0.013),
                          Container(
                            width: _width, //MediaQuery적용하기
                            child: Column(
                              children: [
                                Text(widget.datas["title"],
                                    style: TextStyle(
                                      fontFamily: MyFontFamily.BMJUA,
                                      fontSize: 16,
                                    )),
                                SizedBox(
                                  height: _height * 0.02,
                                ),
                                Container(
                                  width: size.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: _width * 0.05,
                                        ),
                                        SizedBox(
                                          width: _width * 0.005,
                                        ),
                                        Text(widget.datas["rating"] + ' '),
                                        Text(
                                          "(" + widget.datas["review"] + "개)",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600]),
                                        ),
                                        SizedBox(
                                          width: _width * 0.01,
                                        ),
                                        Text(
                                          "/",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: _width * 0.01,
                                        ),
                                        Text(_setPriceFormat(
                                            widget.datas["price"])),
                                        Text(
                                          " " + widget.datas["person"],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
                          SizedBox(height: 6),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    //별점이랑 점수 들어가는 컨테이너
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Column(
                        children: [
                          Container(
                            height: _height * 0.01,
                            width: _width - 20,
>>>>>>> refs/remotes/origin/master
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2.0,
                            ),
                          ),
                          Container(
<<<<<<< HEAD
                            width: 350, // MediaQuery적용하기
                            height: 200,
                            // color: Colors.red,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 70),
=======
                            width: _width, // MediaQuery적용하기
                            height: _height * 0.35,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: _height * 0.11),
>>>>>>> refs/remotes/origin/master
                                    Text(
                                      widget.datas["rating"],
                                      style: TextStyle(
                                        fontFamily: MyFontFamily.BMJUA,
                                        fontSize: 50,
                                      ),
                                    ),
                                    RatingBarIndicator(
                                      rating:
                                          double.parse(widget.datas["rating"]),
                                      itemPadding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 0),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
<<<<<<< HEAD
                                      itemSize: 20.0,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 40),
=======
                                      itemSize: _height * 0.032,
                                    ),
                                  ],
                                ),
                                SizedBox(width: _width * 0.08),
>>>>>>> refs/remotes/origin/master
                                Text(
                                  "|",
                                  style: TextStyle(
                                      fontSize: 100,
                                      color: Colors.amber[700],
                                      fontWeight: FontWeight.w200),
                                ),
<<<<<<< HEAD
                                SizedBox(width: 30),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
=======
                                SizedBox(width: _width * 0.08),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: _height * 0.065,
>>>>>>> refs/remotes/origin/master
                                    ),
                                    Row(
                                      children: [
                                        Text("5점  "),
                                        reviewBox(context),
                                      ],
                                    ),
                                    SizedBox(
<<<<<<< HEAD
                                      height: 10,
=======
                                      height: _height * 0.016,
>>>>>>> refs/remotes/origin/master
                                    ),
                                    Row(
                                      children: [
                                        Text("4점  "),
                                        reviewBox(context),
                                      ],
                                    ),
                                    SizedBox(
<<<<<<< HEAD
                                      height: 10,
=======
                                      height: _height * 0.016,
>>>>>>> refs/remotes/origin/master
                                    ),
                                    Row(
                                      children: [
                                        Text("3점  "),
                                        reviewBox(context),
                                      ],
                                    ),
                                    SizedBox(
<<<<<<< HEAD
                                      height: 10,
=======
                                      height: _height * 0.016,
>>>>>>> refs/remotes/origin/master
                                    ),
                                    Row(
                                      children: [
                                        Text("2점  "),
                                        reviewBox(context),
                                      ],
                                    ),
                                    SizedBox(
<<<<<<< HEAD
                                      height: 10,
=======
                                      height: _height * 0.016,
>>>>>>> refs/remotes/origin/master
                                    ),
                                    Row(
                                      children: [
                                        Text("1점  "),
                                        reviewBox(context),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ), //별점 및 점수 집계)
<<<<<<< HEAD
                          SizedBox(height: 6),
                          Container(
                            height: 10,
                            width: 350,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      //리뷰들어가는 컨테이너
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          dropdownButton(),
                          dropdownButton(),
                          dropdownButton(),
                        ],
                      ),
                    ),
                    reviewListview(context),
                  ],

                ),

              ],
            ),
          );
        },
        itemCount: 1,
      ),
    );
=======
                          SizedBox(height: _height * 0.01),
                          Container(
                              height: 10,
                              width: _width - 20,
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 2.0,
                              )),
                        ],
                      )
                    ])),
                Container(
                    //리뷰들어가는 컨테이너
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Column(
                        children: [
                          SizedBox(height: 6),
                          Container(
                            color: Colors.red[50],
                            width: 300,
                            height: 1000,
                          ), //제품정보)
                          SizedBox(height: 6),
                        ],
                      )
                    ]))
              ],
            ));
      },
      itemCount: 1,
    ));
>>>>>>> refs/remotes/origin/master
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

String _setPriceFormat(String priceString) {
  final oCcy = new NumberFormat("#,###", "ko_KR");
  return "${oCcy.format(int.parse(priceString))}원";
} // 가격 만원단위 형변환

Widget reviewBox(BuildContext context) {
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

Widget reviewListview(BuildContext context) {
  return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 10,
          height: 10,
          color: Colors.black,
          child: Text("1"),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4),
        ); //구분 색깔 지정
      },
      itemCount: 10);
}
