import 'package:flutter/material.dart';
import 'package:mealdang_mvp/utils/util.dart';
import '../data/review.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/page/reviewUI.dart';

class ReviewFrame extends StatefulWidget {
  final int productId;
  final Future<List<Review>> _reviews;
  final List<int> score;

  ReviewFrame(this.productId, this._reviews, this.score);
  @override
  _ReviewFrameState createState() => _ReviewFrameState();
}

class _ReviewFrameState extends State<ReviewFrame> {
  @override
  Widget build(BuildContext context) {
    Future<List<Review>> filteredReview = filteringReview(widget.score);
    return _reviewListView(filteredReview);
  }

  Future<List<Review>> filteringReview(List<int> filter) async {
    List<Review> filterReview = [];
    List<int> tastyLevel = [0, 0, 0]; //리뷰의 맵,단,짠 레벨 저장
    int saltyGap = 0, spicyGap = 0, sweetGap = 0;
    List<Map<String, dynamic>> mapping1 = [];
    int gap;
    for (Review review in await widget._reviews) {
      tastyLevel[0] = review.spicyLevel;
      tastyLevel[1] = review.saltyLevel;
      tastyLevel[2] = review.sweetLevel;

      if (filter[0] != 4) {
        spicyGap = review.spicyLevel - filter[0];
      }
      if (filter[1] != 4) {
        saltyGap = review.saltyLevel - filter[1];
      }
      if (filter[2] != 4) {
        sweetGap = review.sweetLevel - filter[2];
      }
      gap = saltyGap.abs() + spicyGap.abs() + sweetGap.abs();
      saltyGap = 0;
      spicyGap = 0;
      sweetGap = 0;
      mapping1.add({'gap': gap, 'review': review});
    }
    mapping1.sort((a, b) => a['gap'].compareTo(b['gap']));
    for (var i in mapping1) {
      filterReview.add(i['review']);
    }
    return filterReview;
  }

  FutureBuilder _reviewListView(Future<List<Review>> filterReview) {
    final allReview = 0;
    return FutureBuilder(
        future: filterReview,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length != 0) {
              //
              return ListView.separated(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.all(1.sp),
                itemBuilder: (BuildContext context, int index) {
                  Review review = snapshot.data[index];
                  ReviewUI reviewbox =
                      new ReviewUI(review, allReview, widget.score);
                  return reviewbox;
                },
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 1, color: Colors.black.withOpacity(0.4.sp));
                },
              );
            } else
              return Text(
                'Nodata',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              );
          } else
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  MAINCOLOR,
                ),
              ),
            );
        });
  }
}
