import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      future: Future.wait([
        _recommendedProducts,
        _topRatingProducts,
        _lowPriceProducts,
      ]),
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
          } else if (snapshot.hasError) {
            print(snapshot.data);
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.transparent,
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
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
                ProductCard(products[0], 174.w, _width * 0.4),
                ProductCard(products[1], 174.w, _width * 0.4)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProductCard(products[2], 174.w, _width * 0.4),
                ProductCard(products[3], 174.w, _width * 0.4)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ProductCard(products[4], 174.w, _width * 0.4),
                ProductCard(products[5], 174.w, _width * 0.4)
              ],
            ),
          ],
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
      if (isPageSwitched()) {
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

  bool isPageSwitched() {
    if ((_currentPage - _pageController.page).abs() > 0.5) {
      return true;
    }

    return false;
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
                color: Color.fromRGBO(10, 10, 10, 0.4),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.r)),
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

class ProductCard extends StatefulWidget {
  final Product product;
  final double cardWidth;
  final double imageWidth;
  ProductCard(this.product, this.cardWidth, this.imageWidth);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  DBHelper _dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    double rating = widget.product.rating ?? 0.0;
    return Container(
      width: widget.cardWidth,
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(0.0),
          elevation: 0.0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetail(widget.product),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.product.imagePath,
                        width: widget.imageWidth,
                        height: widget.imageWidth,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                          bottom: 5.w,
                          right: 5.w,
                          child: LikeIcon(widget.product, _dbHelper) //여기에 하트 생성
                          ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[${widget.product.companyName}]',
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.grey[700]),
                    ),
                    Text(
                      '${widget.product.name}',
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    _buildPriceTag(widget.product),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 15.sp,
                        ),
                        Text(
                          '$rating',
                          style: TextStyle(color: Colors.red, fontSize: 15.sp),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceTag(Product product) {
    if (product.discountedPrice == null) {
      return Text(
        setPriceFormat(product.price),
        style: TextStyle(
          fontSize: widget.imageWidth * 0.1,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.bold,
        ),
      );
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
                  fontSize: widget.imageWidth * 0.1,
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
                fontSize: widget.imageWidth * 0.1,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    }
  }
}

class LikeIcon extends StatefulWidget {
  final Product product;
  final DBHelper _dbHelper;
  LikeIcon(this.product, this._dbHelper);
  @override
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLikeIcon(widget.product, widget._dbHelper, context);
  }

  Widget _buildLikeIcon(
      Product product, DBHelper _dbHelper, BuildContext context) {
    return GetBuilder<LikeControllerWithGetx>(
      init: LikeControllerWithGetx(),
      id: product.id,
      builder: (controller) {
        controller.dataInit(_dbHelper);

        controller.iconInit(product.id);
        return FutureBuilder(
          future: controller.likeList.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              controller.findLikeproduct(product.id, snapshot.data);
              if (snapshot.hasData) {
                return GestureDetector(
                  child: controller.icon,
                  onTap: () {
                    controller.findLikeproduct(product.id, snapshot.data);
                    controller.clicked(product, _dbHelper);
                    controller.dataChange(_dbHelper);
                    if (!controller.isClicked())
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 1500),
                          content: Text('찜목록에 추가되었습니다.')));
                  },
                );
              } else {
                print("nodata");
              }
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.transparent,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class LikeControllerWithGetx extends GetxController {
  final likeList = Future.value().obs;
  bool click;
  var icon;

  void clicked(Product product, DBHelper _dbHelper) {
    if (click) {
      deleteLike(_dbHelper.db, product.id);
    } else {
      setLike(_dbHelper.db, product);
    }
    likeList.value = getLike(_dbHelper.db);
    update([product.id]);
  }

  void dataInit(DBHelper _dbHelper) {
    likeList.value = getLike(_dbHelper.db);
  }

  void dataChange(DBHelper _dbHelper) {
    likeList.value = getLike(_dbHelper.db);
    update(['likePage']);
  }

  void iconInit(int id) async {
    icon = Icon(
      Icons.favorite_border,
      color: Colors.grey[500],
      size: 18.sp,
    );
    for (var i in await likeList.value) {
      if (id == i.id) {
        icon = Icon(Icons.favorite, color: Colors.red);
      }
    }
  }

  void findLikeproduct(int id, List<Product> likeList) {
    click = false;
    icon = Icon(Icons.favorite_border, color: Colors.grey[500]);
    for (var i in likeList) {
      if (id == i.id) {
        click = true;

        icon = Icon(Icons.favorite, color: Colors.red);
        break;
      }
    }
  }

  bool isClicked() {
    return click;
  }
}

class RecentViewController extends GetxController {
  final recentViewList = Future.value().obs;

  void dataInit(DBHelper _dbHelper) {
    recentViewList.value = getRecentView(_dbHelper.db);
  }

  void productInsert(Product product, DBHelper _dbHelper) async {
    int listCount = 0;
    for (var i in await recentViewList.value) {
      listCount++;
      if (i.id == product.id) {
        deleteRecent(_dbHelper.db, product.id);
        break;
      } else if (listCount > 14) {
        deleteOldestRecent(_dbHelper.db);
        break;
      }
    }
    setRecentView(_dbHelper.db, product);
    update(['recentPage']);
  }
}
