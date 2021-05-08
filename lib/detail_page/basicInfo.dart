import 'package:flutter/material.dart';

class BasicInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.food_bank,size: 200,),
                  Container(height:10,width: 350,child: Divider(color: Colors.grey[300],thickness: 2.0,)),
                  SizedBox(height: 6),
                  Container(color:Colors.red[50],width: 300,height: 100,), //제품정보)
                  SizedBox(height: 6),
                  Container(height:10,width: 350,child: Divider(color: Colors.grey[300],thickness: 2.0,)),
            ],
          ),
        ],
      ),
    );
  }
}