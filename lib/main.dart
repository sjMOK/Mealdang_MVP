import 'package:flutter/material.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(home: MealdangHome(database));
          //return MaterialApp(home: MealdangCategory(database));
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.apartment_outlined,
            size: MediaQuery.of(context).size.width * 0.785),
      ),
    );
  }
}
