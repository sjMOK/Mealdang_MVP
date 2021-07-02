import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:mealdang_mvp/data/categoryData.dart';

class CategoryItem extends StatefulWidget {
  final String categoryName;

  CategoryItem(this.categoryName);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Future<List<Product>> _products;
  DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    _products = getProducts(_dbHelper.db, widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            '${categoryData[widget.categoryName]['name']}',
            style: TextStyle(
              color: Color.fromRGBO(255, 156, 30, 1),
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: _myListView(_dbHelper.db),
        ));
  }

  Widget _myListView(Future<Database> database) {
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
                            ProductDetail(_dbHelper.db, product),
                      ),
                    );
                  },
                  child: _itemContainer(product, index),
                );
              },
              itemCount: snapshot.data.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey),
            );
          } else
            return Text('No Data');
        } else
          return CircularProgressIndicator();
      },
    );
  }

  Widget _itemContainer(Product product, int index) {
    final Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Container(
      color: Colors.transparent,
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
              height: width * 0.32,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '[${product.companyName}]',
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  _buildPrice(product.price, product.discountedPrice),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber[600],
                        ),
                        Text(
                          '${product.rating}',
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: width * 0.02),
                        Icon(
                          Icons.messenger_outline_rounded,
                          color: Colors.orange[800],
                          size: height * 0.025,
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          '${product.reviewCount}',
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500),
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

  Container _buildPrice(int realPrice, int discountedPrice) {
    if (discountedPrice == null) {
      return Container(
        child: Text(
          setPriceFormat(realPrice),
          style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.red[600]),
        ),
      );
    } else {
      int discountedRate = ((1 - discountedPrice / realPrice) * 100).round();

      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Text(
                  '$discountedRate%',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 7),
                Text(
                  setPriceFormat(realPrice),
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey[400],
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            Text(
              setPriceFormat(discountedPrice),
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.red[600]),
            ),
          ],
        ),
      );
    }
  }
}
