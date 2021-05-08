import 'package:flutter/material.dart';
import 'basicInfo.dart';
import 'scoreInfo.dart';
import 'reviewInfo.dart';

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