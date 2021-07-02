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

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    database = initDatabase();
    _widgetOptions = [
      HomePage(database),
      Container(),
      Category(database),
      Center(child: Text('manual', style: TextStyle(fontSize: 32))),
      Survey()
    ];
  }

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
          toolbarHeight: 80.h,
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
              ),
              label: 'Manual',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
              ),
              label: 'Servey',
            ),
          ],
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: mainColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      onWillPop: () {},
    );
  }
}
