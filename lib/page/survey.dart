import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double ratio = MediaQuery.of(context).devicePixelRatio;
    double height = size.height;
    double width = size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.7,
            width: width,
            color: Colors.red,
            //child: Image.asset("assets/images/logo/logo_splash.jpg"),
          ),
          SizedBox(
            height: height * 0.08,
            width: width,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                backgroundColor: Color.fromRGBO(255, 156, 30, 1),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.white,
                      body: SafeArea(
                        child: InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: Uri.parse(
                              'https://naver.com',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "설문조사하고 스타벅스 받기",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
