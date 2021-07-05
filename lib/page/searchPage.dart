import 'package:flutter/material.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  final Future<Database> database;
  SearchPage(this.database);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> _products;
  List<Product> _searchingProducts;

  @override
  void initState() {
    super.initState();
    _products = List.empty();
  }

  @override
  void dispose() {
    print('searchPage dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/logo/logo_appbar.png',
          height: 50.h,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 390.w,
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                onChanged: (String value) async {
                  if (value.isEmpty) {
                    _searchingProducts = List.empty();
                  } else {
                    _searchingProducts =
                        await getSearchingProducts(widget.database, value);
                  }

                  setState(() {
                    _products = _searchingProducts;
                  });
                },
                decoration: InputDecoration(hintText: '검색어를 입력하세요'),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: _buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('product tapped');
            Product product = _products[index];
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ProductDetail(widget.database, product);
              }),
            );
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.search, color: Color.fromRGBO(255, 156, 30, 1)),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  '${_products[index].name}',
                  style: TextStyle(fontSize: 16.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.grey);
      },
    );
  }
}
