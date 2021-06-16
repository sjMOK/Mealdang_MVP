import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/productDetail.dart';

class SearchPage extends StatefulWidget {
  final Future<Database> database;
  SearchPage(this.database);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{
  List<Product> _products;
  List<Product> _searchingProducts;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _products = List.empty();
    _controller.addListener(_updateSearchResult);
  }

  void _updateSearchResult() async {
    _searchingProducts =
        await getSearchingProducts(widget.database, _controller.text);
    setState(() {
      _products = _searchingProducts;
    });
  }

  @override
  void dispose() {
    print('searchPage dispose');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print('tapped');
        FocusScope.of(context).unfocus();
      },
      child: Center(
        child: Container(
          color: Colors.transparent,
          width: _width * 0.95,
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: '검색어를 입력하세요'),
              ),
              SizedBox(height: 10),
              Expanded(
                child: _scroll(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _scroll() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          _products.length,
          (index) {
            return GestureDetector(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search,
                            color: Color.fromRGBO(255, 156, 30, 1)),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            '${_products[index].name}',
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
              onTap: () {
                print('product tapped');
                Product product = _products[index];
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ProductDetail(product);
                  }),
                );
                _controller.clear();
              },
            );
          },
        ),
      ),
    );
  }
}
