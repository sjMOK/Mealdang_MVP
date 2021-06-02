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
      Text('manual', style: TextStyle(fontSize: 32)),
      Text('servey', style: TextStyle(fontSize: 32)),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '밀당',
          style: TextStyle(
            fontFamily: MyFontFamily.BMJUA,
            fontSize: 38,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
              color: Colors.grey,
            ),
            label: 'Manual',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            ),
            label: 'Servey',
          ),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
