import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BuyWebview extends StatelessWidget{
  String givenUrl;
  BuyWebview(String givenUrl){
    this.givenUrl = givenUrl;
  }
  @override
  Widget build(BuildContext context) {
    print(givenUrl);
    return SafeArea(
      child: Scaffold(
        body:WebView(
          initialUrl: givenUrl,//"https://fresheasy.co.kr/goods/view?no=260",
          javascriptMode: JavascriptMode.unrestricted,
          
        )),
    );
  }
}