import 'package:flutter/material.dart';
import 'package:mealdang_mvp/MealdangPractice.dart';
import 'style/font.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/MealdangPractice.dart';

class MealdangListview extends StatefulWidget {
  @override
  _MealdangListviewState createState() => _MealdangListviewState();
}

List<Map<String, String>> datas = [];

class _MealdangListviewState extends State<MealdangListview> {
  @override
  void initState() {
    super.initState();
    datas = [
      {
        "cid" : "1",
        "title": "프레시지 밀푀유나베",
        "price": "20000",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/Fresheasy_1.jpeg"
      },
      {
        "cid" : "2",
        "title": "마이셰프 쿠킹박스",
        "price": "18000",
        "review": "16",
        "image": "assets/images/Category_icon/KoreanFood_icon/bibimbap.png"
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밀당',
            style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 38)),
        backgroundColor: Colors.amber[400],
      ),
      body: _myListView(context),
    );
  }
}

final oCcy = new NumberFormat("#,###", "ko_KR");

String calcStringToWon(String priceString) {
  return "${oCcy.format(int.parse(priceString))}원";
} // 가격 만원단위 형변환

Widget _myListView(BuildContext context) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed('/mealdangPractice'); PushName으로는 데이터 전달이 안되서 push형태로 해봄
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return MealdangPractice(
              data: datas[index],
            );
          }));

          //MealdangPractice로 인덱스데이터 넘겨줌
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: datas[index]["cid"],
                    child: Image.asset(
                      datas[index]["image"],
                      width: 120,
                      height: 120,
                    ),
                  )),
              Expanded(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        datas[index]["title"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: MyFontFamily.BMJUA, fontSize: 15),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(calcStringToWon(datas[index]["price"]),
                          style: TextStyle(
                              fontFamily: MyFontFamily.BMJUA,
                              fontSize: 20,
                              color: Colors.red[600])),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/review.svg",
                              width: 13,
                              height: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(datas[index]["review"]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
    itemCount: datas.length,
    separatorBuilder: (BuildContext context, int index) {
      return Container(
        height: 1,
        color: Colors.black.withOpacity(0.4),
      ); //구분 색깔 지정
    },
  );
}
