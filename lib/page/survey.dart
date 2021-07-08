import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/utils/util.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/survey_image/survey_image.png'),
            width: 411.5.w,
            height: 453.2.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 40.h,
            child: ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                side: BorderSide(
                  width: 1.5.w,
                  color: MAINCOLOR,
                ),
              ),
              child: Text(
                '설문조사하고 기프티콘 받기',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'notoSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
