import 'package:flutter/material.dart';
import 'package:mealdang_mvp/category/mdCategory.dart';
import 'package:mealdang_mvp/db.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();
    
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(home: Splash());
          } else {
            return MaterialApp(home: MealdangCategory(database));
          }
        });
    // return MaterialApp(
    //     title: 'MealdangMVP',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: AnimatedSplashScreen(
    //       splash: "images\Category_icon\CarbSnack_icon\tteokbokki.png",
    //       //"assets\images\Category_icon\CarbSnack_icon\tteokbokki.png",
    //       nextScreen: MealdangCategory(),
    //       splashTransition: SplashTransition.fadeTransition,
    //       backgroundColor: Colors.amber,
    //       duration: 300,

    //     )
    //     //MealdangCategory(),
    //     );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Icon(Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785),
    ));
  }
}
