import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mealdang_mvp/data/ProductData.dart';
import 'package:mealdang_mvp/data/product.dart';

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'mealdang_database.db');

  await deleteDatabase(path);
  return openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
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

      for (var product in productData) 
        await db.insert('Product', product);
    },
  );
}

Future<List<Product>> getProducts(
    Future<Database> db, String categoryName) async {
  Database database = await db;
  final List<Map<String, dynamic>> maps = await database.rawQuery('SELECT * FROM Product WHERE category= "$categoryName"');
  
  print('${maps.length} $categoryName rows returned');
  return List.generate(maps.length, (i) {
    var map = maps[i];
    return Product(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      companyName: map['company_name'],
      servingSize: map['serving_size'],
      price: map['price'],
      discountedPrice: map['discounted_price'],
      imagePath: map['image_path'],
      pageUrl: map['page_url'],
    );
  });
}

Future<List<Product>> getSearchingProducts(Future<Database> db, String text) async{
  Database database = await db;

  final List<Map<String, dynamic>> maps = await database.rawQuery("SELECT * FROM Product WHERE name LIKE '%$text%'");
  return List.generate(maps.length, (i) {
    var map = maps[i];
    return Product(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      companyName: map['company_name'],
      servingSize: map['serving_size'],
      price: map['price'],
      discountedPrice: map['discounted_price'],
      imagePath: map['image_path'],
      pageUrl: map['page_url'],
    );
  });
}
