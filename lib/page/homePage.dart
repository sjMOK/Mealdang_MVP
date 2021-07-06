import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  final ScrollController _scrollController;

  HomePage(this._scrollController);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;
  DBHelper _dbHelper = DBHelper();

  Future<List<Product>> _recommendedProducts;
  Future<List<Product>> _topRatingProducts;
  Future<List<Product>> _lowPriceProducts;

  @override
  void initState() {
    super.initState();
    _recommendedProducts = getRecommendedProducts(_dbHelper.db);
    _topRatingProducts = getTopRatingProducts(_dbHelper.db);
    _lowPriceProducts = getLowPriceProducts(_dbHelper.db);
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      _recommendedProducts = getRecommendedProducts(_dbHelper.db);
    });
  }

  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: _buildScroll(),
    );
  }

  Widget _buildScroll() {
    return FutureBuilder(
      future: Future.wait(
          [_recommendedProducts, _topRatingProducts, _lowPriceProducts]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              controller: widget._scrollController,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    width: _width,
                    height: _width * 9 / 16,
                    child: Manual(),
                  ),
                  _buildGreyDivider(),
                  _buildRecommendProduct(0, snapshot.data[0]),
                  _buildGreyDivider(),
                  _buildRecommendProduct(1, snapshot.data[1]),
                  _buildGreyDivider(),
                  _buildRecommendProduct(2, snapshot.data[2]),
                  _buildGreyDivider(),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color.fromRGBO(255, 156, 30, 1),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(255, 156, 30, 1),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGreyDivider() {
    return Container(
      height: 10.h,
      color: Colors.grey[200],
    );
  }

  Widget _buildRecommendProduct(int mode, List<Product> products) {
    String title;

    switch (mode) {
      case 0:
        title = '오늘 저녁 이 상품 어떠세요?';
        break;
      case 1:
        title = '밀당에서 제일 잘 나가는 상품이에요 :)';
        break;
      case 2:
        title = '이 금액으로는 외식 못할 거예요.';
        break;
    }

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 365.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 22.sp,
                fontFamily: 'notoSans',
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildProductCard(products[0]),
                _buildProductCard(products[1]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildProductCard(products[2]),
                _buildProductCard(products[3]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildProductCard(products[4]),
                _buildProductCard(products[5]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceTag(Product product) {
    if (product.discountedPrice == null) {
      return Text(setPriceFormat(product.price));
    } else {
      return Container(
        child: Row(
          children: [
            Text(
              setPriceFormat(
                product.price,
              ),
              style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                  decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 8.w),
            Text(
              setPriceFormat(
                product.discountedPrice,
              ),
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildProductCard(Product product) {
    double rating = product.rating ?? 0.0;
    return Container(
      width: 174.w,
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
      child: Card(
        margin: const EdgeInsets.all(0.0),
        elevation: 0.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetail(product),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: 174.w,
                  height: 174.w,
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
              _buildPriceTag(product),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  Text(
                    '$rating',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Manual extends StatefulWidget {
  @override
  _ManualState createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      // if (_pageController.page % 1 == 0) {
      //   setState(() {
      //     _currentPage = _pageController.page.toInt();
      //   });
      // }
      if ((_currentPage - _pageController.page).abs() > 0.5) {
        setState(() {
          _currentPage = _pageController.page.round().toInt();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildPageView(),
        Positioned(
          bottom: 5.h,
          right: 5.w,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_currentPage + 1}',
                  style: TextStyle(fontSize: 18.sp, color: Colors.red),
                ),
                Text(
                  ' / 4',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ],
            ),
            width: 80.w,
            height: 22.h,
            decoration: BoxDecoration(
                color: Color.fromRGBO(5, 5, 5, 0.5),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }

  Widget _buildPageView() {
    final List<String> images = <String>[
      'assets/images/pageview_image/preview_1.png',
      'assets/images/pageview_image/preview_2.png',
      'assets/images/pageview_image/preview_3.png',
      'assets/images/pageview_image/preview_4.png',
    ];
    return PageView.builder(
      controller: _pageController,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          images[index],
          fit: BoxFit.fitWidth,
        );
      },
    );
  }
}
