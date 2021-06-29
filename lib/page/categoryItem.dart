import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/utils/util.dart';

Future<List<Product>> _products;

class CategoryItem extends StatefulWidget {
  final Future<Database> database;
  final String categoryName;

  CategoryItem(this.database, this.categoryName);

  @override
  _CategoryItemState createState() {
    _products = getProducts(database, categoryName);
    return _CategoryItemState();
  }
}

class _CategoryItemState extends State<CategoryItem> {
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
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
            'assets/images/logo/logo_appbar.png',
            height: 50,
            fit: BoxFit.contain,
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

    return FutureBuilder(
      future: _products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                Product product = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(widget.database, product),
                      ),
                    );
                  },
                  child: _itemContainer(product, index, _width, _height),
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

  Container _itemContainer(
      Product product, int index, double width, double height) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[600],
                        ),
                        Text(
                          '4.7', //_foodList[index]["rating"],
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
                          '13',
                          //_foodList[index]["review"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
