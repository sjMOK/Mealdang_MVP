import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/detail_page/productInfo.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/food_listview/product.dart';

class MealdangListview extends StatefulWidget {
  final String categoryName;
  final Future<Database> db;

  const MealdangListview(this.categoryName, this.db);

  @override
  _MealdangListviewState createState() => _MealdangListviewState();
}

class _MealdangListviewState extends State<MealdangListview> {
  List<Map<String, dynamic>> _foodList = foodData;
  Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = getProducts();
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
    final Size size = MediaQuery.of(context).size;
    final double _width = size.width;
    final double _height = size.height;

    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (BuildContext context, int index) {
                    Product product = snapshot.data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ProductInfo(data: _foodList[index]);
                          }),
                        );
                      },
                      child: _itemContainer(product, index, _width, _height),
                    );
                  },
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: Colors.black.withOpacity(0.4),
                    ); //구분 색깔 지정
                  },
                );
              } else
                return Text('No Data');
          }
          return CircularProgressIndicator();
        });
  }

  Container _itemContainer(
      Product product, int index, double width, double height) {
    return Container(
      color: Colors.transparent, //상품 어디를 눌러도 OnTap가능하게만듬
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Hero(
              //tag: _foodList[index]["cid"],
              tag: product.id,
              child: Image.asset(
                //_foodList[index]["image"],
                product.imagePath,
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
                  Text(product.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: MyFontFamily.BMJUA, fontSize: 15)),
                  SizedBox(
                    height: height * 0.05, //30,
                  ),
                  Text(
                    _setPriceFormat(product.price.toString()),
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
                          'raiting', //_foodList[index]["rating"],
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
                          'review',
                          //_foodList[index]["review"],
                          style: TextStyle(fontWeight: FontWeight.bold),
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

  Future<List<Product>> getProducts() async {
    Database db = await widget.db;
    String categoryName = widget.categoryName;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM Product WHERE category= "$categoryName"');
    print(maps.length);
    return List.generate(maps.length, (i) {
      var map = maps[i];
      return Product(
        id: map['id'],
        category: map['category'],
        name: map['name'],
        servingSize: map['serving_size'],
        price: map['price'],
        discountedPrice: map['discounted_price'],
        imagePath: map['image_path'],
        pageUrl: map['page_url'],
      );
    });
  }
}
