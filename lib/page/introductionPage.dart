import 'package:flutter/material.dart';
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

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    final imgWidth = MediaQuery.of(context).size.width;

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageFlex: 3,
      bodyAlignment: Alignment.bottomCenter,
    );

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: "밀당",
            body: "밀키트는 맛있습니다.",
            image: _buildImage(
                'FoodPictures/KoreanFood/KoreanFood_1.jpeg', imgWidth),
            decoration: pageDecoration,
          ),
          PageViewModel(
              title: "맛있으면",
              body: '"바나나"',
              image: _buildImage(
                  'FoodPictures/KoreanFood/KoreanFood_2.jpeg', imgWidth),
              decoration: pageDecoration),
        ],
        onDone: () => _onIntroEnd(context),
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text("Skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done"),
      ),
    );
  }
}
