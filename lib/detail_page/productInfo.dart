import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mealdang_mvp/detail_page/buyWebview.dart';
import 'package:mealdang_mvp/detail_page/infoListview.dart';
import 'package:mealdang_mvp/style/font.dart';
class ProductInfo extends StatefulWidget {
  Map<String, String> data;
  ProductInfo({Key key, this.data}) : super(key:key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.data["title"] ,style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 22,color: Colors.black)),
      backgroundColor: Colors.amber[400],
        centerTitle: true,
      ),
      body: InfoListView(widget.data),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child:ElevatedButton(
          child:Text('구매하기',style:TextStyle(fontWeight:FontWeight.bold)),
          onPressed: (){
            
          
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>  InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.data["Url"]))
            ))
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