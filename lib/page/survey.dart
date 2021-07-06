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
    return Stack(
      children: <Widget>[
        Container(
          width: 411.5.w,
          height: 533.2.h,
          child: Image.asset('assets/images/survey_image/survey_image.png'),
        ),
        Positioned(
          width: 240.w,
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
                color: Color.fromRGBO(255, 156, 30, 1),
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
          bottom: 5.h,
          left: 85.5.w,
        ),
      ],
    );
    // SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       SizedBox(height: 20.h),
    //       Container(
    //         child: Image.asset("assets/images/survey_image/survey_image.png"),
    //       ),
    //       SizedBox(height: 65.h),
    //       ElevatedButton(
    //         style: ElevatedButton.styleFrom(
    //             primary: Colors.white,
    //             shape: new RoundedRectangleBorder(
    //               borderRadius: new BorderRadius.circular(30.0),
    //             ),
    //             side: BorderSide(
    //               width: 1.5.w,
    //               color: Color.fromRGBO(255, 156, 30, 1),
    //             )),
    //         onPressed: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => Scaffold(
    //                 backgroundColor: Colors.white,
    //                 body: SafeArea(
    //                   child: InAppWebView(
    //                     initialUrlRequest: URLRequest(
    //                       url: Uri.parse(
    //                         'https://docs.google.com/forms/d/e/1FAIpQLScwNuDVNimw1J7rCHLzk-bAfzXPzevrTxwyKrvUfJXkUx2POQ/viewform',
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //         child: Container(
    //           width: 190.w,
    //           height: 42.h,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 "설문조사하고 기프티콘 받기",
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontFamily: 'NotoSans',
    //                   fontWeight: FontWeight.w700,
    //                   fontSize: 16.sp,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
