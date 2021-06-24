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
    // return FutureBuilder(
    //   future: Future.delayed(Duration(seconds: 2)),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return MaterialApp(home: Splash());
    //     } else {
    //       return MaterialApp(home: MealdangHome());
    //     }
    //   },
    // );
  }
}



// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Icon(Icons.apartment_outlined,
//             size: MediaQuery.of(context).size.width * 0.785),
//       ),
//     );
//   }
// }

