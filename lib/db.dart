import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart';
import 'package:mealdang_mvp/food_listview/product.dart';

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'mealdang_database.db');
  print(path);

  //await deleteDatabase(path);
  return openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      print('database oncreate start');
      await db.execute('CREATE TABLE Product ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          'category TEXT NOT NULL,'
          'name TEXT NOT NULL,'
          'company_name TEXT NOT NULL,'
          'serving_size INTEGER NULL,'
          'price INTEGER NOT NULL,'
          'discounted_price INTEGER NULL,'
          'image_path TEXT NULL,'
          'page_url TEXT NULL'
          ')');
      await db.execute('CREATE TABLE REVIEW ('
          'id INTEGER PRIMARY KEY NOT NULL,'
          'product_id INTEGER NOT NULL,'
          'content TEXT NOT NULL,'
          'rating INTEGER NOT NULL,'
          'FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE NO ACTION'
          ')');
      print('database oncreate finish');
    },
  );
}

void insertDatabase(Future<Database> database) async {
  /*var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'mealdang_database.db');
  
  final Database db = await openDatabase(path, version: 1);*/

  Database db = await database;

  for (var product in productData) {
    await db.insert('Product', product);
  }
}

Future<List<Product>> getProducts(
    Future<Database> database, String categoryName) async {
  Database db = await database;
  final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM Product WHERE category= "$categoryName"');
  print(maps.length);
  return List.generate(maps.length, (i) {
    var map = maps[i];
    return Product(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      servingSize: map['serving_size'],
      price: map['price'],
      discountedPrice: map['discounted_price'],
      imagePath: map['image_path'],
      pageUrl: map['page_url'],
    );
  });
}
