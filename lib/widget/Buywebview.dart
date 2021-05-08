import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BuyWebview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: "https://fresheasy.co.kr/goods/view?no=260",
        javascriptMode: JavascriptMode.unrestricted,
        
      ));
  }
}