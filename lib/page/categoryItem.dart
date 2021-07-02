import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:mealdang_mvp/data/categoryData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatefulWidget {
  final Future<Database> database;
  final String categoryName;

  CategoryItem(this.database, this.categoryName);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  Future<List<Product>> _products;

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
          title: Text(
            '${categoryData[widget.categoryName]['name']}',
            style: TextStyle(
              color: Color.fromRGBO(255, 156, 30, 1),
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w700,
              fontSize: 32.sp,
            ),
          ),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: _myListView(widget.database),
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
                            ProductDetail(widget.database, product),
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
                width: 131.w,
                height: 131.w,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 131.w,
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
                        fontSize: 12.sp,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
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
                          size: 20.sp,
                          color: Colors.amber[600],
                        ),
                        Text(
                          '${product.rating}',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 8.2.w),
                        Icon(
                          Icons.messenger_outline_rounded,
                          color: Colors.orange[800],
                          size: 20.sp,
                        ),
                        SizedBox(width: 4.1.w),
                        Text(
                          '${product.reviewCount}',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
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
              fontSize: 20.sp,
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
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(width: 7.w),
                Text(
                  setPriceFormat(realPrice),
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
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
                  fontSize: 20.sp,
                  color: Colors.red[600]),
            ),
          ],
        ),
      );
    }
  }
}