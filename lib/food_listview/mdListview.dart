import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/detail_page/productInfo.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart' as foodData;
import 'package:mealdang_mvp/style/font.dart';

class MealdangListview extends StatefulWidget {
  @override
  _MealdangListviewState createState() => _MealdangListviewState();
}

class _MealdangListviewState extends State<MealdangListview> {
  List<Map<String, String>> _foodList = foodData.foodData;

  @override
  void initState() {
    super.initState();
    print('listview initState()');
  }

  @override
  void deactivate() {
    print('listview deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('listview dispose');
    super.dispose();
  }

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
          child: Container(
            color: Colors.transparent, //상품 어디를 눌러도 OnTap가능하게만듬
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: _foodList[index]["cid"],
                    child: Image.asset(
                      _foodList[index]["image"],
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
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
                          height: 30,
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/review.svg",
                                width: 13,
                                height: 13,
                              ),
                              SizedBox(width: 5),
                              Text(_foodList[index]["review"]),
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
      itemCount: _foodList.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.black.withOpacity(0.4),
        ); //구분 색깔 지정
      },
    );
  }

  String _setPriceFormat(String priceString) {
    final oCcy = new NumberFormat("#,###", "ko_KR");
    return "${oCcy.format(int.parse(priceString))}원";
  } // 가격 만원단위 형변환
}
