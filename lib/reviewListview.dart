import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'food_listview/review.dart';
import 'reviewBoxContainer.dart';

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
    int saltyGap, spciyGap, sweetGap;
    List<Map<String, dynamic>> mapping1 = [];
    int gap;
    for (Review review in await widget._review) {
      saltyGap = review.saltyLevel - filter[0];
      spciyGap = review.spciyLevel - filter[1];
      sweetGap = review.sweetLevel - filter[2];
      gap = saltyGap.abs() + spciyGap.abs() + sweetGap.abs();
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
