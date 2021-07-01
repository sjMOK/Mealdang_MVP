import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/review.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewBox extends StatefulWidget {
  Review review;
  int separator;
  ReviewBox(this.review, this.separator);
  Text textEffectPDetail(String text) {
    if (this.separator == 1)
      return Text(
        "$text",
        maxLines: 2,
        style: TextStyle(fontSize: 16.sp),
        overflow: TextOverflow.ellipsis,
      );
    return Text(
      "$text",
      style: TextStyle(fontSize: 16.sp),
    );
  }

  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
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
                      "${widget.review.id}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          "매운맛:${widget.review.spicyLevel} ",
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        Text(
                          "짠맛:${widget.review.saltyLevel} ",
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        Text(
                          "단맛:${widget.review.sweetLevel}",
                          style: TextStyle(fontSize: 11.sp),
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
