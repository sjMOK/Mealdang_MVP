import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mealdang_mvp/db.dart';
import 'package:sqflite/sqflite.dart';
import 'food_listview/review.dart';
import 'reviewBoxContainer.dart';

class ReviewListview extends StatefulWidget {
  final Future<Database> database;
  final int productId;
  ReviewListview(this.database, this.productId); //생성자
  @override
  _ReviewListviewState createState() => _ReviewListviewState();
}

class _ReviewListviewState extends State<ReviewListview> {
  Future<List<Review>> _review;

  void initState() {
    super.initState();
    _review = getReviews(widget.database, widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return _reviewListView();
    // Container(
    //   width: _width,
    //   // height: _height * 0.35,
    //   child: Column(
    //     children: [
    //       Container(
    //         //프사,아이디,태그들 적는 곳
    //         padding: EdgeInsets.all(18),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             CircleAvatar(backgroundColor: Colors.black),
    //             SizedBox(width: _width * 0.03),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "부드러운해삼1201",
    //                   style:
    //                       TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Text(
    //                       "매운맛/",
    //                       style: TextStyle(fontSize: 10),
    //                     ),
    //                     Text(
    //                       "짠맛/",
    //                       style: TextStyle(fontSize: 10),
    //                     ),
    //                     Text(
    //                       "단맛",
    //                       style: TextStyle(fontSize: 10),
    //                     ),
    //                   ],
    //                 ),
    //                 RatingBarIndicator(
    //                   rating: 3,
    //                   itemPadding:
    //                       EdgeInsets.symmetric(vertical: 3, horizontal: 0),
    //                   itemBuilder: (context, index) => Icon(
    //                     Icons.star,
    //                     color: Colors.amber,
    //                   ),
    //                   itemCount: 5,
    //                   itemSize: _height * 0.02,
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         // 리뷰 작성 된 곳
    //         width: _width - _width * 0.1,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Image.asset("assets/images/ReviewIconImage/smile.png",
    //                           scale: 15),
    //                       SizedBox(
    //                         width: _width * 0.04,
    //                       ),
    //                       Container(
    //                         width: _width * 0.7,
    //                         // color: Colors.amber,
    //                         child: Text(
    //                           "112312312321323213123123141452161271521321315123111231231232132321312312314145216127152132131512311123123123213232131231231414521612715213213151231",
    //                           style: TextStyle(fontSize: 16),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(height: _height * 0.03),
    //                 Container(
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Image.asset("assets/images/ReviewIconImage/sad.png",
    //                           scale: 15),
    //                       SizedBox(
    //                         width: _width * 0.04,
    //                       ),
    //                       Container(
    //                         width: _width * 0.7,
    //                         // color: Colors.amber,
    //                         child: Text(
    //                           "12345123451234512345123451234512345123451234512123451234512345123451234512345123451234512345123451212345",
    //                           style: TextStyle(fontSize: 16),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(height: _height * 0.03),
    //                 Container(
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Image.asset("assets/images/ReviewIconImage/fork.png",
    //                           scale: 15),
    //                       SizedBox(
    //                         width: _width * 0.04,
    //                       ),
    //                       Container(
    //                         width: _width * 0.7,
    //                         // color: Colors.amber,
    //                         child: Text(
    //                           "1234512345123451234512345123451234512345123451212345123451234512345123451234512345123451234512345121234512345123451234512345123451234512345123451234512123451234512345123451234512345123451234512345123451212345",
    //                           style: TextStyle(fontSize: 16),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: _height * 0.02,
    //                 )
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  FutureBuilder _reviewListView() {
    final allReview = 0;
    return FutureBuilder(
        future: _review,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length != 0) {
              //
              return ListView.separated(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.all(1),
                itemBuilder: (BuildContext context, int index) {
                  Review review = snapshot.data[index];
                  return ReviewBox(review, allReview);
                },
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 1, color: Colors.black.withOpacity(0.4));
                },
              );
            } else
              return Text('Nodata');
          } else
            return CircularProgressIndicator();
        });
  }
  // Container _reviewBox(Review review, double _width, double _height) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           //프사,아이디,태그들 적는 곳
  //           padding: EdgeInsets.all(18),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CircleAvatar(backgroundColor: Colors.black),
  //               SizedBox(width: _width * 0.03),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "${review.id}",
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  //                   ),
  //                   Row(
  //                     children: [
  //                       Text(
  //                         "매운맛:${review.spciyLevel}",
  //                         style: TextStyle(fontSize: 10),
  //                       ),
  //                       Text(
  //                         "짠맛:${review.saltyLevel}",
  //                         style: TextStyle(fontSize: 10),
  //                       ),
  //                       Text(
  //                         "단맛:${review.sweetLevel}",
  //                         style: TextStyle(fontSize: 10),
  //                       ),
  //                     ],
  //                   ),
  //                   RatingBarIndicator(
  //                     rating: review.rating.toDouble(),
  //                     itemPadding:
  //                         EdgeInsets.symmetric(vertical: 3, horizontal: 0),
  //                     itemBuilder: (context, index) => Icon(
  //                       Icons.star,
  //                       color: Colors.amber,
  //                     ),
  //                     itemCount: 5,
  //                     itemSize: _height * 0.02,
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //         Container(
  //           // 리뷰 작성 된 곳
  //           width: _width - _width * 0.1,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Image.asset("assets/images/ReviewIconImage/smile.png",
  //                             scale: 15),
  //                         SizedBox(
  //                           width: _width * 0.04,
  //                         ),
  //                         Container(
  //                           width: _width * 0.7,
  //                           // color: Colors.amber,
  //                           child: Text(
  //                             '${review.contentGood}',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: _height * 0.03),
  //                   Container(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Image.asset("assets/images/ReviewIconImage/sad.png",
  //                             scale: 15),
  //                         SizedBox(
  //                           width: _width * 0.04,
  //                         ),
  //                         Container(
  //                           width: _width * 0.7,
  //                           // color: Colors.amber,
  //                           child: Text(
  //                             '${review.contentBad}',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: _height * 0.03),
  //                   Container(
  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Image.asset("assets/images/ReviewIconImage/fork.png",
  //                             scale: 15),
  //                         SizedBox(
  //                           width: _width * 0.04,
  //                         ),
  //                         Container(
  //                           width: _width * 0.7,
  //                           // color: Colors.amber,
  //                           child: Text(
  //                             '${review.contentKick}',
  //                             style: TextStyle(fontSize: 16),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: _height * 0.02,
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
