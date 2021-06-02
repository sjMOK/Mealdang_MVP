import 'package:flutter/material.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(home: MealdangHome(database));
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
