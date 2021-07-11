import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/page/reviewFrame.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatefulWidget {
  final Product product;
  final Widget ratingContainer;
  final Future<List<Review>> _reviews;

  ReviewPage(this.product, this.ratingContainer, this._reviews);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<int> filter = [4, 4, 4];
  List selected = [null, null, null];
  List listSpicy = [
    Image.asset('assets/images/tasty_icon/spicy_icon1.png'),
    Image.asset('assets/images/tasty_icon/spicy_icon2.png'),
    Image.asset('assets/images/tasty_icon/spicy_icon3.png'),
    Text(
      "전체",
      style: TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: Colors.grey[700],
      ),
    ),
  ];
  List listSalty = [
    Image.asset('assets/images/tasty_icon/salty_icon1.png'),
    Image.asset('assets/images/tasty_icon/salty_icon2.png'),
    Image.asset('assets/images/tasty_icon/salty_icon3.png'),
    Text(
      "전체",
      style: TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: Colors.grey[700],
      ),
    ),
  ];
  List listSweety = [
    Image.asset('assets/images/tasty_icon/sweet_icon1.png'),
    Image.asset('assets/images/tasty_icon/sweet_icon2.png'),
    Image.asset('assets/images/tasty_icon/sweet_icon3.png'),
    Text(
      "전체",
      style: TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
        color: Colors.grey[700],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.product.name + " 리뷰",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w800,
            fontSize: 22.sp,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: _scorll(widget.ratingContainer),
    );
  }

  SingleChildScrollView _scorll(Widget ratingContainer) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: Colors.grey[300],
              thickness: 2.0.sp,
            ),
            SizedBox(height: 20.5.h),
            ratingContainer,
            SizedBox(height: 20.5.h),
            Container(
              height: 30.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20.5.w),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text("매운맛",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.grey[500])),
                      focusColor: Colors.grey,
                      value: selected[0],
                      onChanged: (var values) {
                        setState(() {
                          selected[0] = values;
                          filter[0] = listSpicy.indexOf(values) + 1;
                        });
                      },
                      items: listSpicy.map(
                        (var value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Container(
                              width: 50.w,
                              height: 20.h,
                              alignment: Alignment.center,
                              child: value,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(width: 35.5.w),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text("짠맛",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.grey[500])),
                      value: selected[1],
                      onChanged: (var values) {
                        setState(() {
                          selected[1] = values;
                          filter[1] = listSalty.indexOf(values) + 1;
                        });
                      },
                      items: listSalty.map(
                        (var value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Container(
                              width: 50.w,
                              height: 20.h,
                              alignment: Alignment.center,
                              child: value,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(width: 35.5.w),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text("단맛",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: Colors.grey[500])),
                      value: selected[2],
                      onChanged: (var values) {
                        setState(() {
                          selected[2] = values;
                          filter[2] = listSweety.indexOf(values) + 1;
                        });
                      },
                      items: listSweety.map(
                        (var value) {
                          return DropdownMenuItem(
                            value: value,
                            child: new Container(
                              width: 50.w,
                              height: 20.h,
                              alignment: Alignment.center,
                              child: value,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
            ReviewFrame(widget.product.id, widget._reviews, filter),
          ],
        ),
      ),
    );
  }

  Widget reviewScoreBox() {
    return Stack(
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
              color: Colors.amber),
          width: 20.w,
          height: 15.h,
        ),
      ],
    );
  }
}
