import 'package:flutter/material.dart';
import 'package:mealdang_mvp/MealdangListview.dart';
//import 'MealdangListview.dart';
import 'MealdangCategory.dart';
// import 'package:mealdang_mvp/ButtonWidget/buttonwidget.dart';
import 'package:mealdang_mvp/MealdangPractice.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealdangMVP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/mealdangCategory',
      routes: {
        '/mealdangCategory' : (context) => MealdangCategory(), 
        '/mealdangListview' : (context) => MealdangListview(),
        '/mealdangPractice' : (context) => MealdangPractice(),
      },
      //home: MealdangCategory(),
    );
  }
}