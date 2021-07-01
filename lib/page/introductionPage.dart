import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  void _onIntroEnd(BuildContext context) {
    print('intro done');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MealdangHome()));
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
              title: "밀당",
              body: "밀키트는 맛있습니다.",
              image: _buildImage(
                  'food_pictures/korean_food/KoreanFood_1.jpeg', 411.4.w),
              decoration: pageDecoration,
            ),
            PageViewModel(
                title: "맛있으면",
                body: '"바나나"',
                image: _buildImage(
                    'food_pictures/korean_food/KoreanFood_2.jpeg', 411.w),
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
