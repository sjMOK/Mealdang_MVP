import 'package:flutter/material.dart';
import 'style/font.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/detail_page/productInfo.dart';

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
        "cid": "1",
        "title": "[프레시지] 우삼겹 순두부찌개",
        "price": "7900",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_1.jpeg",
        "Url": "https://fresheasy.co.kr/goods/view?no=260"
      },
      {
        "cid": "2",
        "title": "[프레시지] 장흥회관 낙지곱창전골",
        "price": "25900",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_2.jpeg",
        "Url": "https://fresheasy.co.kr/goods/view?no=635"

      },
      {
        "cid": "3",
        "title": "[마이셰프] 인생 닭갈비(2인)",
        "price": "11900",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_3.jpeg",
        "Url": "https://www.mychef.kr/goods/goods_view.php?goodsNo=1000001231"
      },
      {
        "cid" : "4",
        "title": "[삼삼해물] 꽃개&새우 해물탕",
        "price": "15800",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_4.jpeg",
        "Url" : "https://shopping.naver.com/fresh/homemeal/stores/100565794/products/4735056755?NaPm=ct%3Dkof823yo%7Cci%3D37a83728379270b3ecc0302ebc3deebe89a1e2a0%7Ctr%3Dslsl%7Csn%3D619584%7Chk%3D588da5f0f9c75e3e26b3bc6584bca65183eadfd9",
      },
      {
        "cid": "5",
        "title": "[푸드어셈블] 기승전골 곱창전골(2인)",
        "price": "25900",
        "review": "7",
        "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_5.jpeg",
        "Url": "https://foodasb.co.kr/product/%EB%A7%9B%EC%A7%91%ED%82%A4%ED%8A%B8-%EA%B8%B0%EC%8A%B9%EC%A0%84%EA%B3%A8-%EA%B3%B1%EC%B0%BD%EC%A0%84%EA%B3%A8-%EB%B0%80%ED%82%A4%ED%8A%B82%EC%9D%B8/25/category/49/display/1/",
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
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ProductInfo(
              data: datas[index],
            );
          }));
        },
        child: Container(
          color: Colors.transparent, //상품 어디를 눌러도 OnTap가능하게만듬
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
