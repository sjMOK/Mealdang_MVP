import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/style/font.dart';
//import 'package:intl/intl.dart';
import 'package:mealdang_mvp/page/reviewPage.dart' as review;
import 'package:mealdang_mvp/reviewBoxContainer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/utils/util.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  //ProductInfo({Key key, this.data}) : super(key: key);
  ProductDetail(this.product);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    MediaQueryData _media = MediaQuery.of(context);
    _height = _media.size.height;
    _width = _media.size.width;
    Product product = widget.product;

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
              _productImg(product),
              _divider(),
              _productInfo(product),
              //Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
              _divider(),
              _reviewInfo(),
              _divider(),
              _ratingInfo(),
              _divider(),
              _reviewSection(),
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

    if(product.servingSize != null)
      serving = '${product.servingSize}인분';

    if(product.discountedPrice != null)
      price =  product.discountedPrice;
      
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

  Widget _reviewInfo() {
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

  Widget _ratingInfo() {
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
                _reviewScoreBox(5),
                SizedBox(height: _height * 0.016),
                _reviewScoreBox(4),
                SizedBox(height: _height * 0.016),
                _reviewScoreBox(3),
                SizedBox(height: _height * 0.016),
                _reviewScoreBox(2),
                SizedBox(height: _height * 0.016),
                _reviewScoreBox(1),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _reviewScoreBox(int score) {
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
}
