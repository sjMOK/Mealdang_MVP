import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mealdang_mvp/category/mdCategory.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MealdangMVP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          splash: "images\Category_icon\CarbSnack_icon\tteokbokki.png",

          //"assets\images\Category_icon\CarbSnack_icon\tteokbokki.png",
          nextScreen: MealdangCategory(),
          splashTransition: SplashTransition.fadeTransition,
          //backgroundColor: Colors.amber,
          duration: 300,
        )
        //MealdangCategory(),
        );
  }
}
