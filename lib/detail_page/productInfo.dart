import 'package:flutter/material.dart';
import 'package:mealdang_mvp/detail_page/buyWebview.dart';
import 'package:mealdang_mvp/detail_page/infoListview.dart';

class ProductInfo extends StatefulWidget {
  Map<String, String> data;
  ProductInfo({Key key, this.data}) : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('밀당'),
        centerTitle: true,
      ),
      body: InfoListView(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child:ElevatedButton(
          child:Text('구매하기',style:TextStyle(fontWeight:FontWeight.bold)),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>BuyWebview())
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.amber
          )     
        )
      ),
    );
  }
}