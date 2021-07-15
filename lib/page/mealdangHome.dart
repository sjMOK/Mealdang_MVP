import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/page/survey.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/page/category.dart';
import 'package:mealdang_mvp/page/searchPage.dart';
import 'package:url_launcher/url_launcher.dart';

const int HOME = 0;
const int SEARCH = 1;

class MealdangHome extends StatefulWidget {
  @override
  _MealdangHomeState createState() => _MealdangHomeState();
}

class _MealdangHomeState extends State<MealdangHome> {
  int _selectedIndex;
  Future<Database> database;
  List<Widget> _widgetOptions;
  DateTime currentBackPressTime;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    database = initDatabase();
    _widgetOptions = [
      HomePage(_scrollController),
      Container(),
      Category(),
      Survey(),
    ];
  }

  void _onItemTapped(int index) {
    if (index == SEARCH) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SearchPage(database)));
    } else if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == HOME) {
      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50.h,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/logo/logo_appbar.png',
            height: 40.h,
            fit: BoxFit.contain,
          ),
          actions: [
            IconButton(
              iconSize: 30.sp,
              icon: Icon(
                Icons.search,
                color: MAINCOLOR,
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
        body: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: _widgetOptions,
            ),
            Positioned(
              bottom: 20.h,
              right: -5.w,
              child: MaterialButton(
                height: 45.h,
                color: Colors.yellow,
                shape: CircleBorder(),
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  child: Center(
                    child: Image.asset('assets/images/ask_icon/chat.png'),
                  ),
                ),
                onPressed: () {
                  if (canLaunch('http://pf.kakao.com/_iTJBs/chat') != null) {
                    launch('http://pf.kakao.com/_iTJBs/chat');
                  } else {
                    print('Could not launch ');
                  }
                },
              ),
            ),
          ],
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
          selectedItemColor: MAINCOLOR,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: MAINCOLOR),
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
        now.difference(currentBackPressTime) > Duration(milliseconds: 1500)) {
      currentBackPressTime = now;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 1500),
          content: Text('뒤로가기 버튼을 한번 더 누르면 앱이 종료됩니다'),
          backgroundColor: const Color.fromRGBO(5, 5, 5, 0.8),
          behavior: SnackBarBehavior.floating,
        ),
      );

      return Future.value(false);
    }
    return Future.value(true);
  }
}
