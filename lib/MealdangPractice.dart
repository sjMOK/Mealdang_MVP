import 'package:flutter/material.dart';
import 'mdListview.dart';
import 'style/font.dart';
import 'main.dart';
import 'package:mealdang_mvp/mdCategory.dart';

class MealdangPractice extends StatefulWidget {
  Map<String, String> data;

  MealdangPractice({Key key, this.data}) : super(key: key);

  @override
  _MealdangPracticeState createState() => _MealdangPracticeState();
}

class _MealdangPracticeState extends State<MealdangPractice> {
  Widget _myDetailView(BuildContext context) {
    return Container(
      child: Hero(
        tag: widget.data["cid"],
        child: Image.asset(
          widget.data["image"],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('밀당',
            style: TextStyle(fontFamily: MyFontFamily.BMJUA, fontSize: 38)),
        backgroundColor: Colors.amber[400],
      ),
      body: _myDetailView(context),
    );
  }
}
