import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewUI extends StatefulWidget {
  Review review;
  int separator;
  List<int> score;
  ReviewUI(this.review, this.separator);
  Text textEffectPDetail(String text) {
    if (this.separator == 1)
      return Text(
        "$text",
        maxLines: 2,
        style: TextStyle(
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
        overflow: TextOverflow.ellipsis,
      );
    return Text(
      "$text",
      style: TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
    );
  }

  @override
  _ReviewUIState createState() => _ReviewUIState();
}

class _ReviewUIState extends State<ReviewUI> {
  Color highlightText(int compareScore, int reviewScore) {
    Color highlightColor;
    if (compareScore != 4 && compareScore == reviewScore) {
      highlightColor = Colors.orange[100];
    } else {
      highlightColor = Colors.white;
    }
    return highlightColor;
  }

  Container _buildtastyImage(int count, Image image) {
    if (count == 1) {
      return Container(width: 40.w, height: 30.h, child: image);
    }
    if (count == 2) {
      return Container(width: 40.w, height: 30.h, child: image);
    }
    if (count == 3) {
      return Container(width: 40.w, height: 30.h, child: image);
    }
  }

  @override
  Widget build(BuildContext context) {
    String spicyUrl, saltyUrl, sweetUrl;
    if (widget.review.spicyLevel == 1) {
      spicyUrl = 'assets/images/tasty_icon/spicy_icon1.png';
    }
    if (widget.review.spicyLevel == 2) {
      spicyUrl = 'assets/images/tasty_icon/spicy_icon2.png';
    }
    if (widget.review.spicyLevel == 3) {
      spicyUrl = 'assets/images/tasty_icon/spicy_icon3.png';
    }
    if (widget.review.saltyLevel == 1) {
      saltyUrl = 'assets/images/tasty_icon/salty_icon1.png';
    }
    if (widget.review.saltyLevel == 2) {
      saltyUrl = 'assets/images/tasty_icon/salty_icon2.png';
    }
    if (widget.review.saltyLevel == 3) {
      saltyUrl = 'assets/images/tasty_icon/salty_icon3.png';
    }
    if (widget.review.sweetLevel == 1) {
      sweetUrl = 'assets/images/tasty_icon/sweet_icon1.png';
    }
    if (widget.review.sweetLevel == 2) {
      sweetUrl = 'assets/images/tasty_icon/sweet_icon2.png';
    }
    if (widget.review.sweetLevel == 3) {
      sweetUrl = 'assets/images/tasty_icon/sweet_icon3.png';
    }
    return Container(
      width: 411.w,
      child: Column(
        children: [
          Container(
            //프사,아이디,태그들 적는 곳
            padding: EdgeInsets.fromLTRB(30.sp, 20.sp, 20.sp, 20.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 23.w,
                ),
                SizedBox(width: 12.3.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${getRandomName()}",
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  child: Row(
                                    children: [
                                      _buildtastyImage(
                                        widget.review.spicyLevel,
                                        Image.asset(spicyUrl),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[0],
                                            widget.review.spicyLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.sp),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  child: Row(
                                    children: [
                                      _buildtastyImage(widget.review.saltyLevel,
                                          Image.asset(saltyUrl)),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[1],
                                            widget.review.saltyLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.sp),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  child: Row(
                                    children: [
                                      _buildtastyImage(widget.review.saltyLevel,
                                          Image.asset(sweetUrl))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[2],
                                            widget.review.sweetLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    RatingBarIndicator(
                      rating: widget.review.rating.toDouble(),
                      itemPadding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 13.66.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            // 리뷰 작성 된 곳
            width: 410.w,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/smile.png",
                          scale: 20.sp),
                      SizedBox(
                        width: 16.4.w,
                      ),
                      Container(
                          width: 287.w,
                          // color: Colors.amber,
                          child: widget
                              .textEffectPDetail(widget.review.contentGood)),
                    ],
                  ),
                  SizedBox(height: 20.5.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/sad.png",
                          scale: 20.sp),
                      SizedBox(
                        width: 16.4.w,
                      ),
                      Container(
                          width: 287.7.w,
                          // color: Colors.orange,
                          child: widget
                              .textEffectPDetail(widget.review.contentBad)),
                    ],
                  ),
                  SizedBox(height: 20.5.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/fork.png",
                          scale: 20.sp),
                      SizedBox(
                        width: 16.44.w,
                      ),
                      Container(
                          width: 287.7.w,
                          // color: Colors.red,
                          child: widget
                              .textEffectPDetail(widget.review.contentKick)),
                    ],
                  ),
                  SizedBox(height: 20.5.h),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
