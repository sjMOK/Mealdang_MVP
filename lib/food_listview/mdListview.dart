import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/detail_page/productInfo.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart';
import 'package:mealdang_mvp/style/font.dart';

class MealdangListview extends StatefulWidget {
  @override
  _MealdangListviewState createState() => _MealdangListviewState();
}

class _MealdangListviewState extends State<MealdangListview> {
  List<Map<String, dynamic>> _foodList = foodData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밀당',
            style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 38)),
        backgroundColor: Colors.amber[400],
      ),
      body: _myListView(),
    );
  }

  Widget _myListView() {
    final Size size = MediaQuery.of(context).size;
    final double _width = size.width;
    final double _height = size.height;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ProductInfo(data: _foodList[index]);
              }),
            );
          },
          child: _itemContainer(index, _width, _height),
        );
      },
      itemCount: _foodList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4),
        ); //구분 색깔 지정
      },
    );
  }

  Container _itemContainer(int index, double width, double height) {
    return Container(
      color: Colors.transparent, //상품 어디를 눌러도 OnTap가능하게만듬
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Hero(
              tag: _foodList[index]["cid"],
              child: Image.asset(
                _foodList[index]["image"],
                width: width * 0.32,
                height: width * 0.32,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: height * 0.15, //원래 height *0.2 였던 것을 0.15로 바꿈
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_foodList[index]["title"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyFontFamily.BMJUA, fontSize: 15)),
                  SizedBox(
                    height: height * 0.05, //30,
                  ),
                  Text(
                    _setPriceFormat(_foodList[index]["price"]),
                    style: TextStyle(
                        fontFamily: MyFontFamily.BMJUA,
                        fontSize: 20,
                        color: Colors.red[600]),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[600],
                        ),
                        Text(
                          _foodList[index]["rating"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: width * 0.02),
                        Icon(
                          Icons.messenger_outline_rounded,
                          color: Colors.orange[800],
                          size: height * 0.025,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[600],
                              ),
                              Text(
                                _foodList[index]["rating"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: width * 0.02),
                              Icon(
                                Icons.messenger_outline_rounded,
                                color: Colors.orange[800],
                                size: height * 0.025,
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                _foodList[index]["review"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _setPriceFormat(String priceString) {
    final oCcy = new NumberFormat("#,###", "ko_KR");
    return "${oCcy.format(int.parse(priceString))}원";
  } // 가격 만원단위 형변환
}
