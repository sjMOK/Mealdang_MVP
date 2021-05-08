import 'package:flutter/material.dart';

class ScoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 6),
                  Container(color:Colors.red[50],width: 300,height: 100,), //별점 및 점수 집계)
                  SizedBox(height: 6),
                  Container(height:10,width: 350,child: Divider(color: Colors.grey[300],thickness: 2.0,)),
            ],
          )
        ]
      ) 
    );
  }
}