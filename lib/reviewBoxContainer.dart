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
      height: _height*0.4,
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            //프사,아이디,태그들 적는 곳
            padding: EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundColor: Colors.black),
                SizedBox(width: _width*0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("부드러운해삼1201",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Row(
                      children: [
                        Text("매운맛/",style: TextStyle(fontSize: 10),),
                        Text("짠맛/",style: TextStyle(fontSize: 10),),
                        Text("단맛",style: TextStyle(fontSize: 10),),
                      ],
                    ),
                    RatingBarIndicator(
                      rating:3,
                      itemPadding: EdgeInsets.symmetric(
                          vertical: 3, horizontal: 0),
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
            width: _width-36,
            height: _height*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/ReviewIconImage/smile.png",scale: 15),
                    Image.asset("assets/images/ReviewIconImage/sad.png",scale: 15),
                    Image.asset("assets/images/ReviewIconImage/fork.png",scale: 15),
                  ],
                ),
                SizedBox(width: _width*0.05,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: _width*0.7,
                      height: _height*0.04,
                      color: Colors.black,
                    ),
                    Container(
                      width: _width*0.7,
                      height: _height*0.04,
                      color: Colors.orange,
                    ),
                    Container(
                      width: _width*0.7,
                      height: _height*0.04,
                      color: Colors.red,
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
