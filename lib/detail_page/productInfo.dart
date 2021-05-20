import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mealdang_mvp/detail_page/infoListview.dart';
import 'package:mealdang_mvp/food_listview/product.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart';
import 'package:intl/intl.dart';
import 'package:mealdang_mvp/detail_page/reviewPage.dart' as review;
import 'package:mealdang_mvp/reviewBoxContainer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  //ProductInfo({Key key, this.data}) : super(key: key);
  ProductInfo(this.product);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    _height = media.size.height;
    _width = media.size.width;
    Product product = widget.product;
    var food = foodData[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('[${product.companyName}] ${product.name}',
            style: TextStyle(
                fontFamily: MyFontFamily.BMJUA,
                fontSize: 22,
                color: Colors.black)),
        backgroundColor: Colors.amber[400],
        centerTitle: true,
      ),
      body: _scroll(product), 
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: Text(
            '구매하기',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.push(
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
            );
          },
          style: ElevatedButton.styleFrom(primary: Colors.amber),
        ),
      ),
    );
  }

  SingleChildScrollView _scroll(Product product) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: _width * 0.95,
          child: Column(
            children: [
              SizedBox(height: 12.0),
              _productImg(product),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _productInfo(product),
              //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _reviewInkwellContainer(),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _ratingContainer(),
              Divider(
                color: Colors.grey[300],
                thickness: 2.0,
              ),
              _reviewSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImg(Product product) {
    return Container(
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
              Text('rating'),
              Text(
                'review',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Text(
                " / ",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(width: _width * 0.01),
              Text(_setPriceFormat(product.price)),
              Text(
                ' ${product.servingSize}인분',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _reviewInkwellContainer() {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => review.ReviewPage()));
        },
        child: Row(
          children: [
            Text(
              "  리뷰  ",
              style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 20),
            ),
            Text(
              '리뷰 갯수',
              //widget.datas["review"],
              style: TextStyle(
                  fontFamily: MyFontFamily.BMJUA,
                  fontSize: 20,
                  color: Colors.amber[900]),
            ),
            SizedBox(width: _width * 0.55),
            Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }

  Widget _ratingContainer() {
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '3.0',
                  //'widget.datas["rating"]',
                  style: TextStyle(
                    fontFamily: MyFontFamily.BMJUA,
                    fontSize: 50,
                  ),
                ),
                RatingBarIndicator(
                  rating: 3.0,
                  //double.parse(widget.datas["rating"]),
                  itemPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
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
            Column(
              children: [
                reviewScoreBox(5),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(4),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(3),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(2),
                SizedBox(height: _height * 0.016),
                reviewScoreBox(1),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget reviewScoreBox(int score) {
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
              width: 100 * 0.2,
              height: 15,
            ),
          ],
        )
      ],
    );
  }

  Widget _reviewSection() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => review.ReviewPage()));
      },
      child: Column(
        children: [
          //리뷰 작성된 것들 들어가는 곳 ,2개까지만 노출시키기 !!
          ReviewBox(),
          Divider(
            color: Colors.grey,
            thickness: 3,
          ),
          ReviewBox(),
        ],
      ),
    );
  }

  DropdownButton dropdownButton() {
    String valueChoose;
    List listItem = ["Item 1", "Item 2", "Item 3"];
    return DropdownButton(
      hint: Text("입맛 !"),
      value: valueChoose,
      onChanged: (newValue) {
        setState(() {
          valueChoose = newValue;
        });
      },
      items: listItem.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }

  String _setPriceFormat(int price) {
    final oCcy = new NumberFormat("#,###", "ko_KR");
    return "${oCcy.format(price)}원";
  } // 가격 만원단위 형변환
}
