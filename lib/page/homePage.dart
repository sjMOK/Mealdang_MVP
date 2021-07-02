import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  final Future<Database> database;

  HomePage(this.database);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;

  Future<List<Product>> _recommendedProducts;
  Future<List<Product>> _topRatingProducts;
  Future<List<Product>> _lowPriceProducts;

  @override
  void initState() {
    super.initState();
    _recommendedProducts = getRecommendedProducts(widget.database);
    _topRatingProducts = getTopRatingProducts(widget.database);
    _lowPriceProducts = getLowPriceProducts(widget.database);
  }

  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return _buildScroll();
  }

  Widget _buildScroll() {
    return FutureBuilder(
      future: Future.wait(
          [_recommendedProducts, _topRatingProducts, _lowPriceProducts]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: _width,
                    height: _width * 9 / 16,
                    child: Manual(),
                  ),
                  Container(
                    height: 14,
                    color: Colors.grey[200],
                  ),
                  _buildRecommendProduct(0, snapshot.data[0]),
                  Container(
                    height: 14,
                    color: Colors.grey[200],
                  ),
                  _buildRecommendProduct(1, snapshot.data[1]),
                  Container(
                    height: 14,
                    color: Colors.grey[200],
                  ),
                  _buildRecommendProduct(2, snapshot.data[2]),
                  Container(
                    height: 14,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            );
          }
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

  Widget _buildRecommendProduct(int mode, List<Product> products) {
    String title;

    switch (mode) {
      case 0:
        title = '밀.잘.알. 밀당이 추천하는 밀키트를 접해보세요!';
        break;
      case 1:
        title = '평점이 높은 밀키트';
        break;
      case 2:
        title = '가성비 갑!';
        break;
    }

    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'notoSans',
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildProductCard(products[0]),
            _buildProductCard(products[1]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildProductCard(products[2]),
            _buildProductCard(products[3]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildProductCard(products[4]),
            _buildProductCard(products[5]),
          ],
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    int price = product.price;
    double rating = product.rating ?? 0.0;

    if (product.discountedPrice != null) {
      price = product.discountedPrice;
    }

    return Container(
      width: _width * 0.4,
      margin: EdgeInsets.fromLTRB(10, 6, 10, 6),
      child: Card(
        elevation: 0.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(widget.database, product)));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                product.imagePath,
                width: _width * 0.4,
                height: _width * 0.4,
                fit: BoxFit.fill,
              ),
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
              Text(setPriceFormat(price)),
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
      if (_pageController.page % 1 == 0) {
        setState(() {
          _currentPage = _pageController.page.toInt();
        });
      }
    });

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage == 2) {
        _currentPage = 0;
      } else {
        _currentPage++;
      }

      if (_pageController.page % 1 == 0) {
        _pageController.animateToPage(
          _currentPage % 3,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
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
          bottom: 10,
          right: 10,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_currentPage + 1}',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  '/ 3',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            width: 100,
            height: 30,
            decoration: BoxDecoration(
                color: Color.fromRGBO(5, 5, 5, 0.5),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8)),
          ),
        )
      ],
    );
  }

  Widget _buildPageView() {
    final List<String> images = <String>[
      "assets/images/food_pictures/korean_food/KoreanFood_1.jpeg",
      "assets/images/food_pictures/korean_food/KoreanFood_2.jpeg",
      "assets/images/food_pictures/korean_food/KoreanFood_3.jpeg"
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
