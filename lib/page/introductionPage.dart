import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  void _onIntroEnd(BuildContext context) {
    print('intro done');
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    TextStyle bodyStyle = TextStyle(fontSize: _width * 0.05);
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle:
          TextStyle(fontSize: _width * 0.07, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding:
          EdgeInsets.fromLTRB(_width * 0.02, 0, _width * 0.02, _width * 0.02),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageFlex: 3,
      bodyAlignment: Alignment.bottomCenter,
    );
    Widget _buildImage(String assetName, [double width]) {
      return Image.asset('assets/images/$assetName', width: width);
    }

    return ScreenUtilInit(
      designSize: Size(411.5, 683.4),
      builder: () => Scaffold(
        body: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "밀키트",
              body: "정리 안된 밀키트 카테고리별로 정리",
              image: _buildImage(
                  'introduction_image/IntroductionImage_1.png', 510.w),
              decoration: pageDecoration,
            ),
            PageViewModel(
                title: "맛있으면",
                body: '"바나나"',
                image: _buildImage(
                    'introduction_image/IntroductionImage_2.png', 510.w),
                decoration: pageDecoration),
            PageViewModel(
                title: "맛있으면",
                body: '"바나나"',
                image: _buildImage(
                    'introduction_image/IntroductionImage_3.png', 510.w),
                decoration: pageDecoration),
            PageViewModel(
                title: "맛있으면",
                body: '"바나나"',
                image: _buildImage(
                    'introduction_image/IntroductionImage_4.png', 510.w),
                decoration: pageDecoration),
          ],
          onDone: () => _onIntroEnd(context),
          skipFlex: 0,
          nextFlex: 0,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
          done: const Text("Done"),
        ),
      ),
    );
  }
}
