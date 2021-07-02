import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromRGBO(255, 156, 30, 1);
    return SingleChildScrollView(
      child: Container(
        color: mainColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(color: Colors.red, height: 480.h
                //child: Image.asset("assets/images/logo/logo_splash.jpg"),
                ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.all(Radius.zero)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: mainColor,
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
                                    'https://docs.google.com/forms/d/e/1FAIpQLScwNuDVNimw1J7rCHLzk-bAfzXPzevrTxwyKrvUfJXkUx2POQ/viewform',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 42.h,
                      color: mainColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "설문조사하고 스타벅스 받기",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NotoSans',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
