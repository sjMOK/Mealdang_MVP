import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../data/review.dart';
import 'reviewBoxContainer.dart';

//futre<database> database 삭제하기
class ReviewListview extends StatefulWidget {
  final Future<Database> database;
  final int productId;
  Future<List<Review>> _review;
  List<int> score;
  ReviewListview(this.database, this.productId, this._review, this.score); //생성자
  @override
  _ReviewListviewState createState() => _ReviewListviewState();
}

class _ReviewListviewState extends State<ReviewListview> {
  @override
  Widget build(BuildContext context) {
    Future<List<Review>> filteredReview = filteringReview(widget.score);
    print("현재 입력된 필터");
    print(widget.score);
    return _reviewListView(filteredReview);
  }

  Future<List<Review>> filteringReview(List<int> filter) async {
    List<Review> filterReview = [];
    List<int> tastyLevel = [0, 0, 0]; //리뷰의 맵,단,짠 레벨 저장
    int saltyGap = 0, spicyGap = 0, sweetGap = 0;
    List<Map<String, dynamic>> mapping1 = [];
    int gap;
    for (Review review in await widget._review) {
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
      // for (int i in filter) {
      //   if (i != 0) {
      //     gap += tastyLevel[cnt] - filter[cnt];
      //   }
      // }

      gap = saltyGap.abs() + spicyGap.abs() + sweetGap.abs();
      saltyGap = 0;
      spicyGap = 0;
      sweetGap = 0;
      mapping1.add({'gap': gap, 'review': review});
    }
    mapping1.sort((a, b) => a['gap'].compareTo(b['gap']));
    print("check the sorted data");
    print(mapping1);
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
}
