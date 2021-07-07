import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  double _width, _height;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        rawPages: [
          _buildImageContainer('introduction_image/introduction_image_1.png'),
          _buildImageContainer('introduction_image/introduction_image_2.png'),
          _buildImageContainer('introduction_image/introduction_image_3.png'),
          _buildStack(),
        ],
        skipFlex: 0,
        nextFlex: 0,
        showDoneButton: false,
        showNextButton: false,
        showSkipButton: false,
        dotsDecorator: const DotsDecorator(
          activeColor: MAINCOLOR,
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(20.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String assetName) {
    return Container(
      width: _width,
      height: _height,
      child: Image.asset('assets/images/$assetName'),
    );
  }

  Widget _buildStack() {
    return Stack(
      children: <Widget>[
        Container(
          width: _width,
          height: _height,
          child: Image.asset(
              'assets/images/introduction_image/introduction_image_4.png'),
        ),
        Positioned(
          width: 190.w,
          height: 42.h,
          child: ElevatedButton(
            onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('seen', true);
              Navigator.of(context).pushReplacementNamed('/home');
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
              '밀당 시작하기!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ),
          bottom: 80.h,
          left: 110.75.w,
        ),
      ],
    );
  }
}
