import 'package:flutter/material.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';
import 'package:flutter/services.dart';
import 'package:mealdang_mvp/page/splash.dart';
import 'package:mealdang_mvp/page/introductionPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/intro': (context) => IntroductionPage(),
        '/home': (context) => MealdangHome(),
      },
    );
  }
}
