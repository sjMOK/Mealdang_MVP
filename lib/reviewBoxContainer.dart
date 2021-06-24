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
                        Image.asset("assets/images/review_icon_image/smile.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.amber,
                          child: Text(
                            "레시피대로 끓일 때 혹시나 싱거울까봐 물 조금 덜 넣었어요 짜게먹는 저희 집한테는 물 100ml적게 넣은게 신의 한수네요ㅎ",
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
                        Image.asset("assets/images/review_icon_image/sad.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.orange,
                          child: Text(
                            "아이스박스가 터지고 배송이 조금 아쉬웠습니다 ㅜ",
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
                        Image.asset("assets/images/review_icon_image/fork.png",
                            scale: 15),
                        SizedBox(
                          width: _width * 0.04,
                        ),
                        Container(
                          width: _width * 0.7,
                          height: _height * 0.06,
                          // color: Colors.red,
                          child: Text(
                            "제공되는 파 이외의 집에 대파있으시면 대파 좀 썰어서 넣어서 드시면 짱이에요 ㅎ",
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
