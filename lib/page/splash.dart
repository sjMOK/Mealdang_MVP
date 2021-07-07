import 'package:flutter/material.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool('seen');

    if (_seen == null) {
      _seen = false;
    }

    if (_seen) {
      Navigator.popAndPushNamed(context, '/home');
    } else {
      Navigator.popAndPushNamed(context, '/intro');
    }
  }

  // Future<void> _handleStartScreen() async {
  //   Navigator.popAndPushNamed(context, '/home');
  // }

  @override
  void initState() {
    super.initState();
    print('spalsh init');

    DBHelper().db;
    Future.delayed(Duration(milliseconds: 1500), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Center(
            child: Image.asset('assets/images/logo/logo_splash.jpg',
                width: _width, height: _width),
          ),
        ],
      ),
    );
  }
}
