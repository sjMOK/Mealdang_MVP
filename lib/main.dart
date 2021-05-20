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
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(home: MealdangCategory(database));
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
