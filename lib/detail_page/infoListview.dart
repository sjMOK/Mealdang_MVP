import 'package:flutter/material.dart';
import 'package:mealdang_mvp/style/font.dart';

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
    return Container(
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
                            width: 150,
                            height: 150,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            height: 10,
                            width: 350,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2.0,
                            )),
                        SizedBox(height: 6),
                        Container(
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
                                width: 200,
                                child: Row(children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 20.0,
                                  ),
                                  Text(widget.datas["rating"] + ' '),
                                  Text(widget.datas["review"]),
                                ]),
                              )
                            ],
                          ),
                        ),
                        //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
                        SizedBox(height: 6),
                        Container(
                            height: 10,
                            width: 350,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                //별점이랑 점수 들어가는 컨테이너
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  SizedBox(height: 6),
                  Container(
                    color: Colors.red[50],
                    width: 300,
                    height: 100,
                  ), //별점 및 점수 집계)
                  SizedBox(height: 6),
                  Container(
                      height: 10,
                      width: 350,
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 2.0,
                      )),
                ],
              )
            ])),
            Container(
                //리뷰들어가는 컨테이너
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
  }
}
