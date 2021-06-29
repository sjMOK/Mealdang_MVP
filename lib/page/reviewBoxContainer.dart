import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/data/review.dart';

class ReviewBox extends StatefulWidget {
  Review review;
  int separator;
  ReviewBox(this.review, this.separator);
  Text textEffectPDetail(String text) {
    if (this.separator == 1)
      return Text(
        "$text",
        maxLines: 3,
        style: TextStyle(fontSize: 16),
        overflow: TextOverflow.ellipsis,
      );
    return Text(
      "$text",
      style: TextStyle(fontSize: 16),
    );
  }

  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _height = size.height;
    final _width = size.width;
    return Container(
      width: _width,
      child: Column(
        children: [
          Container(
            //프사,아이디,태그들 적는 곳
            padding: EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundColor: Colors.black),
                SizedBox(width: _width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.review.id}}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          "매운맛:${widget.review.spicyLevel}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "짠맛:${widget.review.saltyLevel}",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "단맛:${widget.review.sweetLevel}",
                          style: TextStyle(fontSize: 10),
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
                      itemSize: _height * 0.02,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            // 리뷰 작성 된 곳
            width: _width - _width * 0.1,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/smile.png",
                          scale: 15),
                      SizedBox(
                        width: _width * 0.04,
                      ),
                      Container(
                          width: _width * 0.7,
                          height: _height * 0.1,
                          // color: Colors.amber,
                          child: widget
                              .textEffectPDetail(widget.review.contentGood)),
                    ],
                  ),
                  SizedBox(height: _height * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/sad.png",
                          scale: 15),
                      SizedBox(
                        width: _width * 0.04,
                      ),
                      Container(
                          width: _width * 0.7,
                          height: _height * 0.1,
                          // color: Colors.orange,
                          child: widget
                              .textEffectPDetail(widget.review.contentBad)),
                    ],
                  ),
                  SizedBox(height: _height * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/review_icon_image/fork.png",
                          scale: 15),
                      SizedBox(
                        width: _width * 0.04,
                      ),
                      Container(
                          width: _width * 0.7,
                          height: _height * 0.1,
                          // color: Colors.red,
                          child: widget
                              .textEffectPDetail(widget.review.contentKick)),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
