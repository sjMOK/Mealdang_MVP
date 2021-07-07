import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewUI extends StatefulWidget {
  final Review reviews;
  final int separator;
  final List<int> score; // productDetail에서
  ReviewUI(this.reviews, this.separator, this.score);
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
      width: 1.sw,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            width: 0.9.sw,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 5.w),
                Container(
                  width: 50.w,
                  height: 50.w,
                  child: Image.asset('assets/images/profile_image/profile.png'),
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
                                        widget.reviews.spicyLevel,
                                        Image.asset(getTastyIconUrl(
                                            'spicy',
                                            widget.reviews.spicyLevel
                                                .toString())),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[0],
                                            widget.reviews.spicyLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9.r),
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
                                        widget.reviews.saltyLevel,
                                        Image.asset(getTastyIconUrl(
                                          'salty',
                                          widget.reviews.saltyLevel.toString(),
                                        )),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[1],
                                            widget.reviews.saltyLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9.r),
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
                                          widget.reviews.saltyLevel,
                                          Image.asset(getTastyIconUrl(
                                              'sweet',
                                              widget.reviews.sweetLevel
                                                  .toString())))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: widget.separator == 0
                                        ? highlightText(widget.score[2],
                                            widget.reviews.sweetLevel)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(9.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    RatingBarIndicator(
                      rating: widget.reviews.rating.toDouble(),
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
          _buildReviewContents('smile', widget.reviews.contentGood),
          SizedBox(height: 20.5.h),
          _buildReviewContents('sad', widget.reviews.contentBad),
          SizedBox(height: 20.5.h),
          _buildReviewContents('fork', widget.reviews.contentKick),
          SizedBox(height: 20.5.h),
        ],
      ),
    );
  }

  Container _buildReviewContents(String item, String contents) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 0.9.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            child: Image.asset("assets/images/review_icon_image/$item.png"),
          ),
          SizedBox(
            width: 16.4.w,
          ),
          Container(width: 0.7.sw, child: widget.textEffectPDetail(contents)),
        ],
      ),
    );
  }
}
