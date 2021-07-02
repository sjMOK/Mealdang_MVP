import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/page/survey.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/page/category.dart';
import 'package:mealdang_mvp/page/searchPage.dart';

class MealdangHome extends StatefulWidget {
  @override
  _MealdangHomeState createState() => _MealdangHomeState();
}

class _MealdangHomeState extends State<MealdangHome> {
  int _selectedIndex;
  Future<Database> database;
  List<Widget> _widgetOptions;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    database = initDatabase();
    _widgetOptions = [
      HomePage(),
      Container(),
      Category(),
<<<<<<< HEAD
      Center(child: Text('manual', style: TextStyle(fontSize: 32))),
      Survey()
    ];
  }

  @override
  dispose() {
    print('mdHome dispse');
    super.dispose();
  }
=======
      Center(child: Text('servey', style: TextStyle(fontSize: 32))),
    ];
  }

>>>>>>> refs/remotes/origin/master

  void _onItemTapped(int index) {
    if (index == 1) {
      print('search tapped');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SearchPage(database)));
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromRGBO(255, 156, 30, 1);
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70.h,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/logo/logo_appbar.png',
            height: 50.h,
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
              iconSize: 40.sp,
              icon: Icon(
                Icons.search,
                color: mainColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SearchPage(database)));
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: '검색',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_rounded,
              ),
              label: '카테고리',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              label: '설문조사',
            ),
          ],
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: mainColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          showUnselectedLabels: true,
          selectedFontSize: 12.0,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 1500),
          content: Text('뒤로가기 버튼을 한번 더 누르면 앱이 종료됩니다'),
          backgroundColor: const Color.fromRGBO(5, 5, 5, 0.8),
          behavior: SnackBarBehavior.floating,
        ),
      );

      print('종료');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
