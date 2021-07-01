import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:mealdang_mvp/page/reviewPage.dart';
import 'package:mealdang_mvp/page/reviewBoxContainer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<List<Review>> _review;

class ProductDetail extends StatefulWidget {
  final Future<Database> database;
  final Product product;
  //ProductInfo({Key key, this.data}) : super(key: key);
  ProductDetail(
    this.database,
    this.product,
  );

  @override
  _ProductDetailState createState() {
    _review = getReviews(database, product.id);
    return _ProductDetailState();
  }
}

class _ProductDetailState extends State<ProductDetail> {
  double _height;
  double _width;
  List<Review> reviews;

  @override
  void initState() {
    _review = getReviews(widget.database, widget.product.id);

    super.initState();
  }

  Future getFutureReview(Future<List<Review>> _review) async {
    reviews = await _review;
    return reviews;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);
    _height = _media.size.height;
    _width = _media.size.width;
    Product product = widget.product;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            '[${product.companyName}] ${product.name}',
            style: TextStyle(
                fontFamily: MyFontFamily.BMJUA,
                fontSize: 22.sp,
                color: Colors.black),
          ),
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
        ),
        body: _scroll(product),
        bottomNavigationBar: GestureDetector(
          child: Container(
            height: 48.h,
            color: const Color.fromRGBO(255, 156, 30, 1),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
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
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "구매하기",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  SingleChildScrollView _scroll(Product product) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 390.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _productImg(product),
              _divider(),
              _productInfo(product),
              //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
              Divider(
                color: Colors.grey[300],
                thickness: 2.0.w,
              ),
              _reviewInkwellContainer(product, context),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0.w,
              ),
              _ratingContainer(context),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0.w,
              ),
              ReviewPartListview(widget.product, _ratingContainer(context),
                  _review, widget.database),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 2.0.w,
    );
  }

  Widget _productImg(Product product) {
    return Container(
      padding: EdgeInsets.only(top: 30.h),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
    String serving = '';
    int price = product.price;
    if (product.servingSize != null) serving = '${product.servingSize}인분';

    if (product.discountedPrice != null) price = product.discountedPrice;

    return Container(
      child: Column(
        children: [
          Text(
            '[${product.companyName}] ${product.name}',
            style: TextStyle(
              fontFamily: MyFontFamily.BMJUA,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 13.6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
                size: 20.5.w,
              ),
              SizedBox(width: 2.w),
              FutureBuilder(
                  future: _review,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      int sum = 0;
                      int cnt = 0;
                      double avg = 0;
                      if (snapshot.data.length != 0) {
                        for (Review review in snapshot.data) {
                          sum += review.rating;
                          cnt++;
                        }
                        avg = sum / cnt;
                        return Row(
                          children: [
                            Text("$avg($cnt)",
                                style: TextStyle(fontSize: 16.sp)),
                            Text(
                              " / ",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 17.sp),
                            ),
                            SizedBox(width: 4.1.w),
                            Text(setPriceFormat(price),
                                style: TextStyle(fontSize: 16.sp)),
                            SizedBox(width: 4.1.w),
                            Text(
                              "($serving)",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        );
                      }
                      return Text("0", style: TextStyle(fontSize: 16.sp));
                    } else
                      return CircularProgressIndicator();
                  }),
            ],
          ),
        ],
      ),
    );
  }

  FutureBuilder _reviewInkwellContainer(Product product, BuildContext context) {
    FutureBuilder ratingContainer = _ratingContainer(context);
    return FutureBuilder(
      future: _review,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReviewPage(
                        widget.database, product, ratingContainer, _review)));
              },
              child: Row(
                children: [
                  Text(
                    "  리뷰  ",
                    style: TextStyle(
                        fontFamily: MyFontFamily.BMJUA, fontSize: 20.sp),
                  ),
                  Text(
                    '${snapshot.data.length}',
                    //widget.datas["review"],
                    style: TextStyle(
                        fontFamily: MyFontFamily.BMJUA,
                        fontSize: 20.sp,
                        color: Colors.amber[900]),
                  ),
                  SizedBox(width: 263.w),
                  Icon(Icons.arrow_forward_ios_sharp, size: 25.sp)
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  FutureBuilder _ratingContainer(BuildContext context) {
    return FutureBuilder(
      future: _review,
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return CircularProgressIndicator();
        }
        int sum = 0;
        double avg = 0;
        if (snapshot.data.length != 0) {
          for (var review in snapshot.data) {
            sum = sum + review.rating;
          }
          avg = sum / snapshot.data.length;
        }
        return Container(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$avg',
                      //'widget.datas["rating"]',
                      style: TextStyle(
                        fontFamily: MyFontFamily.BMJUA,
                        fontSize: 50.sp,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: avg,
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
                  color: const Color.fromRGBO(255, 156, 30, 1),
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
      },
    );
  }

  Widget reviewScoreBox(int score, int all, int part) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$score점  ', style: TextStyle(fontSize: 15.sp)),
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
                  color: const Color.fromRGBO(255, 156, 30, 1)),
              width: 100 * (part / all).w,
              height: 15.h,
            ),
          ],
        )
      ],
    );
  }

  FutureBuilder _reviewRating(BuildContext context) {
    List<int> arrayRating = [0, 0, 0, 0, 0, 0];
    return FutureBuilder(
      future: _review,
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length != 0) {
            for (var review in snapshot.data) {
              arrayRating[review.rating]++;
            }
            print(arrayRating[5]);
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
        return CircularProgressIndicator();
      },
    );
  }
}

class ReviewPartListview extends StatefulWidget {
  Product product;
  FutureBuilder ratingContainer;
  Future<List<Review>> _review;
  Future<Database> database;
  ReviewPartListview(
      this.product, this.ratingContainer, this._review, this.database);
  @override
  _ReviewPartListviewState createState() => _ReviewPartListviewState();
}

class _ReviewPartListviewState extends State<ReviewPartListview> {
  final partReview = 1;
  List<int> score = [0, 0, 0];
  List<int> filter = [0, 0, 0];
  int change = 1;

  @override
  Widget build(BuildContext context) {
    return reviewPart();
  }

  InkWell reviewPart() {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ReviewPage(widget.database, widget.product,
                  widget.ratingContainer, widget._review)));
        },
        child: FutureBuilder(
            future: widget._review,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.length != 0) {
                  print(snapshot.data);
                  return Column(
                    children: [
                      ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(1.sp),
                        itemBuilder: (context, index) {
                          Review review = snapshot.data[index];
                          return ReviewBox(review, partReview);
                        },
                        itemCount: 2,
                        separatorBuilder: (BuildContext context, index) {
                          return Container(
                              height: 1.h,
                              color: Colors.black.withOpacity(0.4.sp));
                        },
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ReviewPage(
                                    widget.database,
                                    widget.product,
                                    widget.ratingContainer,
                                    _review)),
                          );
                        },
                        icon: Icon(Icons.add, size: 24.sp, color: Colors.black),
                        label: Text("리뷰 모두보기",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ),
                    ],
                  );
                } else
                  return Text('아직 달린 댓글이 없습니다.',
                      style: TextStyle(fontSize: 17.sp));
              } else
                return CircularProgressIndicator();
            }));
  }
}
