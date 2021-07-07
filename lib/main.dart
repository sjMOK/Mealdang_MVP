import 'package:flutter/material.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';
import 'package:flutter/services.dart';
import 'package:mealdang_mvp/page/splash.dart';
import 'package:mealdang_mvp/page/introductionPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

//  return ScreenUtilInit(
//       designSize: Size(411.5, 683.4),
//       builder: () => Scaffold(
//         body: Introduc
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411.5, 683.4),
      builder: () => MaterialApp(

        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child,
          );
        },
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => Splash(),
          '/intro': (context) => IntroductionPage(),
          '/home': (context) => MealdangHome(),
        },
      ),
    );
  }
}
