import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewUI extends StatefulWidget {
  final Review review;
  final int separator;
  List<int> score; // productDetail에서
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
    } else {
      return null;
    }
  }

  String getTastyIconUrl(String tasty, String level) {
    return 'assets/images/tasty_icon/${tasty}_icon$level.png';
  }

  @override
  Widget build(BuildContext context) {
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
                                        Image.asset(getTastyIconUrl(
                                            'spicy',
                                            widget.review.spicyLevel
                                                .toString())),
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
                                      _buildtastyImage(
                                        widget.review.saltyLevel,
                                        Image.asset(getTastyIconUrl(
                                          'salty',
                                          widget.review.saltyLevel.toString(),
                                        )),
                                      ),
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
                                      _buildtastyImage(
                                          widget.review.saltyLevel,
                                          Image.asset(getTastyIconUrl(
                                              'sweet',
                                              widget.review.sweetLevel
                                                  .toString())))
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
                  _buildReviewContents('smile', widget.review.contentGood),
                  SizedBox(height: 20.5.h),
                  _buildReviewContents('sad', widget.review.contentBad),
                  SizedBox(height: 20.5.h),
                  _buildReviewContents('fork', widget.review.contentKick),
                  SizedBox(height: 20.5.h),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Container _buildReviewContents(String item, String contents) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/review_icon_image/$item.png",
              scale: 20.sp),
          SizedBox(
            width: 16.4.w,
          ),
          Container(width: 287.w, child: widget.textEffectPDetail(contents)),
        ],
      ),
    );
  }
}
