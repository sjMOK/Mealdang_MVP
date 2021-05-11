import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';


class BuyWebview extends StatelessWidget{
  String givenUrl;
  WebViewController _webviewController; 
  BuyWebview(String givenUrl){
    this.givenUrl = givenUrl;
  }
  @override
  Widget build(BuildContext context) {
    print(givenUrl);
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(givenUrl))
        )       

      ),
    );
  }
}
