import 'package:flutter/material.dart';
import 'package:mealdang_mvp/page/mdCategory.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/style/font.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';

class MealdangHome extends StatefulWidget {
  final Future<Database> database;
  MealdangHome(this.database);

  @override
  _MealdangHomeState createState() => _MealdangHomeState();
}

class _MealdangHomeState extends State<MealdangHome> {
  Future<List<Product>> _products;
  final List<Widget> _widgetOptions = <Widget>[];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _products = getAllProducts(widget.database);
    _widgetOptions.addAll([
      MealdangCategory(widget.database),
      Text('search', style: TextStyle(fontSize: 32)),
      Text('manual', style: TextStyle(fontSize: 32)),
      Text('servey', style: TextStyle(fontSize: 32)),
    ]);
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
