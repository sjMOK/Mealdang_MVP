import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';
import 'package:mealdang_mvp/page/reviewPage.dart';
import 'package:mealdang_mvp/page/reviewUI.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<List<Review>> _reviews;
  RecentViewController controller;
  DBHelper _dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();
    _reviews = getReviews(_dbHelper.db, widget.product.id);
    controller = Get.put(RecentViewController());
    controller.dataInit(_dbHelper);
    controller.productInsert(widget.product, _dbHelper);
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '상품 정보',
          style: TextStyle(
              fontFamily: "NotoSans",
              fontWeight: FontWeight.w800,
              fontSize: 22.sp,
              color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _scroll(product),
          Positioned(
            bottom: 20.h,
            right: -5.w,
            child: MaterialButton(
              height: 45.h,
              color: Colors.yellow,
              shape: CircleBorder(),
              child: Container(
                height: 35.h,
                width: 35.h,
                child: Center(
                  child: Image.asset('assets/images/ui_icon/chat.png'),
                ),
              ),
              onPressed: () {
                openKakaoAsking();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey[300], width: 1.w))),
        height: 53.h,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70.h,
                  automaticallyImplyLeading: true,
                  iconTheme: IconThemeData(color: Colors.black),
                  title: Text(
                    '밀당',
                    style: TextStyle(
                      color: MAINCOLOR,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w700,
                      fontSize: 32.sp,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 1.0,
                  backgroundColor: Colors.white,
                ),
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(product.pageUrl),
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300], width: 2.w)),
                  child: LikeIcon(product, _dbHelper, 35.w, Colors.grey[500]),
                ),
                SizedBox(width: 5.w),
                Container(
                  color: MAINCOLOR,
                  width: 1.sw - 70.w,
                  child: Center(
                    child: Text(
                      "구매하기",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSans',
                          fontWeight: FontWeight.w800,
                          fontSize: 18.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _scroll(Product product) {
    return FutureBuilder(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 390.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 8.h),
                        _productImg(product),
                        _divider(),
                        _productInfo(product),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 2.0.w,
                        ),
                        _reviewInkwellContainer(product, context),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 2.0.w,
                        ),
                        _ratingContainer(product, context),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 2.0.w,
                        ),
                        ReviewPartListview(
                            widget.product, _ratingContainer(product, context)),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  MAINCOLOR,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                MAINCOLOR,
              ),
            ),
          );
        });
  }

  Widget _divider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 2.0.w,
      height: 16.h,
    );
  }

  Widget _productImg(Product product) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        child: Hero(
          tag: product.id,
          child: Image.asset(
            product.imagePath,
            width: 246.w,
            height: 246.w,
          ),
        ),
      ),
    );
  }

  Widget _productInfo(Product product) {
    int price = product.price;

    if (product.discountedPrice != null) {
      price = product.discountedPrice;
    }

    return Container(
      child: Column(
        children: [
          Text(
            '[${product.companyName}] ${product.name}',
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontWeight: FontWeight.w800,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 13.6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[700],
                size: 20.5.w,
              ),
              SizedBox(width: 2.w),
              Text(
                '${product.rating}',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                " / ",
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w800,
                  fontSize: 17.sp,
                ),
              ),
              SizedBox(width: 4.1.w),
              Text(
                setPriceFormat(price),
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(width: 4.1.w),
              if (product.servingSize != null)
                Text(
                  '(${product.servingSize}인분)',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _reviewInkwellContainer(Product product, BuildContext context) {
    Container ratingContainer = _ratingContainer(product, context);
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ReviewPage(product, ratingContainer, _reviews)));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            children: [
              Text(
                "  리뷰  ",
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              Text(
                '${product.reviewCount}',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_sharp, size: 25.sp)
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingContainer(Product product, BuildContext context) {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${product.rating}',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 50.sp,
                  ),
                ),
                RatingBarIndicator(
                  rating: product.rating,
                  //double.parse(widget.datas["rating"]),
                  itemPadding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 0),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 21.sp,
                ),
              ],
            ),
            VerticalDivider(
              color: MAINCOLOR,
              thickness: 1.5.w,
              indent: 5.h,
              endIndent: 5.h,
              width: 82.w,
            ),
            _reviewRating(context),
          ],
        ),
      ),
    );
  }

  Widget reviewScoreBox(int score, int all, int part) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$score점  ',
          style: TextStyle(
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.w)),
              width: 100.w,
              height: 15.h,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.w),
                  color: MAINCOLOR),
              width: 100 * (part / all).w,
              height: 15.h,
            ),
          ],
        )
      ],
    );
  }

  FutureBuilder _reviewRating(BuildContext context) {
    List<int> arrayRating;
    return FutureBuilder(
      future: _reviews,
      builder: (context, snapshot) {
        arrayRating = [0, 0, 0, 0, 0, 0];
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length != 0) {
            for (var review in snapshot.data) {
              arrayRating[review.rating]++;
            }
            return Column(
              children: [
                reviewScoreBox(5, snapshot.data.length, arrayRating[5]),
                SizedBox(height: 10.9.h),
                reviewScoreBox(4, snapshot.data.length, arrayRating[4]),
                SizedBox(height: 10.9.h),
                reviewScoreBox(3, snapshot.data.length, arrayRating[3]),
                SizedBox(height: 10.9.h),
                reviewScoreBox(2, snapshot.data.length, arrayRating[2]),
                SizedBox(height: 10.9.h),
                reviewScoreBox(1, snapshot.data.length, arrayRating[1]),
              ],
            );
          }
          return Column(
            children: [
              reviewScoreBox(5, 1, arrayRating[5]),
              SizedBox(height: 10.9.h),
              reviewScoreBox(4, 1, arrayRating[4]),
              SizedBox(height: 10.9.h),
              reviewScoreBox(3, 1, arrayRating[3]),
              SizedBox(height: 10.9.h),
              reviewScoreBox(2, 1, arrayRating[2]),
              SizedBox(height: 10.9.h),
              reviewScoreBox(1, 1, arrayRating[1]),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              MAINCOLOR,
            ),
          ),
        );
      },
    );
  }
}

class ReviewPartListview extends StatefulWidget {
  final Product product;
  final Container ratingContainer;

  ReviewPartListview(this.product, this.ratingContainer);

  @override
  _ReviewPartListviewState createState() => _ReviewPartListviewState();
}

class _ReviewPartListviewState extends State<ReviewPartListview> {
  final partReview = 1;
  List<int> score = [0, 0, 0];
  List<int> filter = [0, 0, 0];
  int change = 1;

  DBHelper _dbHelper = DBHelper();
  Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();

    _reviews = getReviews(_dbHelper.db, widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return reviewPart();
  }

  InkWell reviewPart() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ReviewPage(widget.product, widget.ratingContainer, _reviews),
          ),
        );
      },
      child: FutureBuilder(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length != 0) {
              return Column(
                children: [
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Review review = snapshot.data[index];
                      return ReviewUI(review, partReview, []);
                    },
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, index) {
                      return Container(
                          height: 1.h, color: Colors.black.withOpacity(0.4.sp));
                    },
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ReviewPage(widget.product,
                                widget.ratingContainer, _reviews)),
                      );
                    },
                    icon: Icon(Icons.add, size: 24.sp, color: Colors.black),
                    label: Text(
                      "리뷰 모두보기",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              );
            } else
              return Text(
                '아직 달린 댓글이 없습니다.',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                ),
              );
          } else
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  MAINCOLOR,
                ),
              ),
            );
        },
      ),
    );
  }
}
