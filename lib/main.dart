import 'package:flutter/material.dart';
import 'package:mealdang_mvp/mdListview.dart';
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
      /*
      initialRoute: '/mealdangCategory',
      routes: {
        '/mealdangCategory' : (context) => MealdangCategory(), 
        '/mealdangListview' : (context) => MealdangListview(),
      },
      */
      home: MealdangCategory(),
    );
  }
}