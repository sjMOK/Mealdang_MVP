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
                fontSize: 22,
                color: Colors.black),
          ),
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
        ),
        body: _scroll(product),
        bottomNavigationBar: GestureDetector(
          child: Container(
              height: _height * 0.07,
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))),
        ));
  }

  SingleChildScrollView _scroll(Product product) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: _width * 0.95,
          child: Column(
            children: [
              _productImg(product),
              _divider(),
              _productInfo(product),
              //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _reviewInkwellContainer(product, context),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _ratingContainer(context),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              ReviewPartListview(widget.product, _ratingContainer(context),
                  _review, widget.database),
              //_reviewSection(product),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 2.0,
    );
  }

  Widget _productImg(Product product) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Hero(
          tag: product.id,
          child: Image.asset(
            product.imagePath,
            width: _width * 0.6,
            height: _width * 0.6,
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
              fontSize: 16,
            ),
          ),
          SizedBox(height: _height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
                size: _width * 0.05,
              ),
              SizedBox(width: _width * 0.005),
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
                        return Text("$avg($cnt)");
                      }
                      return Text("0");
                    } else
                      return CircularProgressIndicator();
                  }),
              Text(
                " / ",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(width: _width * 0.01),
              Text(setPriceFormat(price)),
              SizedBox(width: _width * 0.01),
              Text(
                serving,
                style: TextStyle(fontSize: 12),
              ),
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
                    style:
                        TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 20),
                  ),
                  Text(
                    '${snapshot.data.length}',
                    //widget.datas["review"],
                    style: TextStyle(
                        fontFamily: MyFontFamily.BMJUA,
                        fontSize: 20,
                        color: Colors.amber[900]),
                  ),
                  SizedBox(width: _width * 0.64),
                  Icon(Icons.arrow_forward_ios_sharp)
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
                        fontSize: 50,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: avg,
                      //double.parse(widget.datas["rating"]),
                      itemPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: _height * 0.032,
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.amber[700],
                  thickness: 1.5,
                  indent: 5,
                  endIndent: 5,
                  width: _width * 0.2,
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
        Text('$score점  '),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              width: 100,
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.amber),
              width: 100 * (part / all),
              height: 15,
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
                SizedBox(height: _height * 0.016),
                reviewScoreBox(4, snapshot.data.length, arrayRating[4]),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(3, snapshot.data.length, arrayRating[3]),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(2, snapshot.data.length, arrayRating[2]),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(1, snapshot.data.length, arrayRating[1]),
              ],
            );
          }
          return Column(
            children: [
              reviewScoreBox(5, 1, arrayRating[5]),
              SizedBox(height: _height * 0.016),
              reviewScoreBox(4, 1, arrayRating[4]),
              SizedBox(height: _height * 0.016),
              reviewScoreBox(3, 1, arrayRating[3]),
              SizedBox(height: _height * 0.016),
              reviewScoreBox(2, 1, arrayRating[2]),
              SizedBox(height: _height * 0.016),
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
              builder: (context) => ReviewPage(widget.database,
                  widget.product, widget.ratingContainer, widget._review)));
        },
        child: FutureBuilder(
            future: widget._review,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.length != 0) {
                  print(snapshot.data);
                  return ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(1),
                    itemBuilder: (context, index) {
                      Review review = snapshot.data[index];
                      return ReviewBox(review, partReview);
                    },
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, index) {
                      return Container(
                          height: 1, color: Colors.black.withOpacity(0.4));
                    },
                  );
                } else
                  return Text('아직 달린 댓글이 없습니다.');
              } else
                return CircularProgressIndicator();
            }));
  }
}
