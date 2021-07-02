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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 420.h,
            color: Colors.red,
            //child: Image.asset("assets/images/logo/logo_splash.jpg"),
          ),
          Container(
            color: mainColor,
            child: Row(
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
                  child: Text(
                    "설문조사하고 스타벅스 받기",
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
