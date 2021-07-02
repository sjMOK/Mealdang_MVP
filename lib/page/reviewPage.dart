import 'package:flutter/material.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:sqflite/sqlite_api.dart';
import '../style/font.dart';
import 'package:mealdang_mvp/page/reviewListview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatefulWidget {
  final Future<Database> database;
  Product product;
  Widget ratingContainer;
  Future<List<Review>> _review;
  ReviewPage(this.database, this.product, this.ratingContainer, this._review);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<int> filter = [4, 4, 4];
  List selected = ["전체", "전체", "전체"];
  List listSpicy = ["맵아이콘1", "맵아이콘x2", "맵아이콘x3", "전체"];
  List listSalty = ["짠아이콘1", "짠아이콘x2", "짠아이콘x3", "전체"];
  List listSweety = ["단아이콘1", "단아이콘x2", "단아이콘x3", "전체"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.product.name + " 리뷰",
          style: TextStyle(
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w500,
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
          children: [
            Divider(
              color: Colors.grey[300],
              thickness: 2.0.sp,
            ),
            SizedBox(height: 20.5.h),
            ratingContainer,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
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
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(width: 20.5.w),
                  DropdownButton(
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
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(width: 20.5.w),
                  DropdownButton(
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
                          child: Text(
                            value,
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
            ReviewListview(
                widget.database, widget.product.id, widget._review, filter),
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
