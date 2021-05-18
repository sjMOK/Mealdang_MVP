import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewBox extends StatelessWidget {
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
                      "부드러운해삼1201",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          "매운맛/",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "짠맛/",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "단맛",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    RatingBarIndicator(
                      rating: 3,
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
            width: _width - _width*0.1,
            height: _height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/ReviewIconImage/smile.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.amber,
                          child: Text(
                            "112312312321323213123123141452161271521321315123111231231232132321312312314145216127152132131512311123123123213232131231231414521612715213213151231",
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/ReviewIconImage/sad.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.orange,
                          child: Text(
                            "12345123451234512345123451234512345123451234512123451234512345123451234512345123451234512345123451212345",
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/ReviewIconImage/fork.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.red,
                          child: Text(
                            "1234512345123451234512345123451234512345123451212345123451234512345123451234512345123451234512345121234512345123451234512345123451234512345123451234512123451234512345123451234512345123451234512345123451212345",
                            style: TextStyle(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
