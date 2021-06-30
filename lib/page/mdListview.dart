import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/categoryData.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/utils/util.dart';

Future<List<Product>> _products;

class MealdangListview extends StatefulWidget {
  final Future<Database> database;
  final String categoryName;

  MealdangListview(this.database, this.categoryName);

  @override
  _MealdangListviewState createState() {
    _products = getProducts(database, categoryName);
    return _MealdangListviewState();
  }
}

class _MealdangListviewState extends State<MealdangListview> {
  @override
  void initState() {
    super.initState();
    _products = getProducts(widget.database, widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          categoryData[widget.categoryName]["name"],
          style: TextStyle(
            fontFamily: MyFontFamily.BMJUA,
            fontSize: 38,
            color: const Color.fromRGBO(255, 156, 30, 1),
          ),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: _myListView(widget.database),
    );
  }

  Widget _myListView(Future<Database> database) {
    final Size size = MediaQuery.of(context).size;
    final double _width = size.width;
    final double _height = size.height;
    Future<List<Review>> _reviews;

    return FutureBuilder(
      future: _products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                Product product = snapshot.data[index];
                _reviews = getReviews(widget.database, product.id);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(widget.database, product),
                      ),
                    );
                  },
                  child:
                      _itemContainer(product, index, _width, _height, _reviews),
                );
              },
              itemCount: snapshot.data.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: Colors.grey);
              },
            );
          } else
            return Text('No Data');
        } else
          return CircularProgressIndicator();
      },
    );
  }

  Container _itemContainer(Product product, int index, double width,
      double height, Future<List<Review>> reviews) {
    Widget getAvg(Future<List<Review>> _reviews) {
      return FutureBuilder(
          future: _reviews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                int sum = 0;
                int cnt = 0;
                double avg;
                for (Review review in snapshot.data) {
                  sum += review.rating;
                  cnt++;
                }
                avg = sum / cnt;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber[600],
                    ),
                    Text(
                      '$avg', //_foodList[index]["rating"],
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
                      '$cnt', //_foodList[index]["rating"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }
            }
            return Text(
              '0', //_foodList[index]["rating"],
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          });
    }

    return Container(
      color: Colors.transparent, //상품 어디를 눌러도 OnTap가능하게만듬
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Hero(
              tag: product.id,
              child: Image.asset(
                product.imagePath,
                width: width * 0.32,
                height: width * 0.32,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: width * 0.30,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '[${product.companyName}] ${product.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: MyFontFamily.BMJUA,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  _denotePrice(product.price, product.discountedPrice),
                  Expanded(
                    child: getAvg(reviews),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _denotePrice(int realprice, int discountprice) {
    String realPrice = setPriceFormat(realprice);
    if (discountprice == null) {
      return Container(
        child: Text(
          realPrice,
          style: TextStyle(
              fontFamily: MyFontFamily.BMJUA,
              fontSize: 20,
              color: Colors.red[600]),
        ),
      );
    } else {
      String discountPrice = setPriceFormat(discountprice);
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              realPrice,
              style: TextStyle(
                  fontFamily: MyFontFamily.BMJUA,
                  fontSize: 15,
                  color: Colors.grey[400],
                  decoration: TextDecoration.lineThrough),
            ),
            Text(
              discountPrice,
              style: TextStyle(
                  fontFamily: MyFontFamily.BMJUA,
                  fontSize: 20,
                  color: Colors.red[600]),
            ),
          ],
        ),
      );
    }
  }
}
