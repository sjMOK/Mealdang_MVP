import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:mealdang_mvp/page/mdCategory.dart';
import 'package:mealdang_mvp/page/searchPage.dart';

class MealdangHome extends StatefulWidget {
  final Future<Database> database;
  MealdangHome(this.database);

  @override
  _MealdangHomeState createState() => _MealdangHomeState();
}

class _MealdangHomeState extends State<MealdangHome> {
  List<Widget> _widgetOptions;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      MealdangCategory(widget.database),
      SearchPage(widget.database),
      Center(child: Text('manual', style: TextStyle(fontSize: 32))),
      Center(child: Text('servey', style: TextStyle(fontSize: 32))),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '밀당',
            style: TextStyle(
              fontFamily: MyFontFamily.BMJUA,
              fontSize: 38,
              color: const Color.fromRGBO(255, 156, 30, 1),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: const Color.fromRGBO(255, 156, 30, 1),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
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
          selectedItemColor: const Color.fromRGBO(255, 156, 30, 1),
          unselectedItemColor: Colors.grey,
          selectedIconTheme: IconThemeData(color: const Color.fromRGBO(255, 156, 30, 1)),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      onWillPop: () {},
    );
  }
}
