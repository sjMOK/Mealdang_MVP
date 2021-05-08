import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mealdangpage/widget/Buywebview.dart';
import 'package:mealdangpage/widget/InfoListView.dart';
import 'package:webview_flutter/webview_flutter.dart';




void main() {
  runApp(MyApp());
}
class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ProductInfo(),
    );
  }
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