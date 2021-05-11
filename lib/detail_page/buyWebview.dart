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
        // body:WebView(
        //   initialUrl: givenUrl, //givenUrl,"https://fresheasy.co.kr/goods/view?no=260",
        //   onWebViewCreated: (WebViewController webViewController){
        //     _webviewController = webViewController;
        //     _webviewController.evaluateJavascript('window.function()');
        //   },
        //   javascriptMode: JavascriptMode.unrestricted,
          
        // )
      ),
    );
  }
}
