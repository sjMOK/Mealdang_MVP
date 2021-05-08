import 'package:flutter/material.dart';

class ReviewInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 6),
                  Container(color:Colors.red[50],width: 300,height: 1000,), //제품정보)
                  SizedBox(height: 6),
            ],
          )
        ]
      )      
    );
  }
}