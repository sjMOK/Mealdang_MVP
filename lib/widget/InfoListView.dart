import 'package:flutter/material.dart';
import 'package:mealdangpage/widget/basicInfo.dart';
import 'package:mealdangpage/widget/reviewInfo.dart';
import 'package:mealdangpage/widget/scoreInfo.dart';

class InfoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, int index){
          return Container(
            child:Column(
              children: <Widget>[
                BasicInfo(),
                ScoreInfo(),
                ReviewInfo(),
              ],
            )
          );
        },
        itemCount: 1,
      )
    );
  }
}