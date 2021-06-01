import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mealdang_mvp/food_listview/foodData.dart';
import 'package:mealdang_mvp/food_listview/product.dart';
import 'package:mealdang_mvp/food_listview/review.dart';

import 'food_listview/review.dart';

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'mealdang_database.db');
  print(path);

  await deleteDatabase(path);
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
          'id INTEGER ,' //PRIMARY KEY AUTOINCREMENT NOT NULL
          'product_id INTEGER NOT NULL,'
          'spciy_level INTEGER NOT NULL,'
          'salty_level INTEGER NOT NULL,'
          'sweet_level INTEGER NOT NULL,'
          'content_good TEXT NOT NULL,'
          'content_bad TEXT NOT NULL,'
          'content_kick TEXT NOT NULL,'
          'rating INTEGER NOT NULL,'
          'FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE NO ACTION'
          ')');
      print('database oncreate finish');

      for (var product in productData) await db.insert('Product', product);

      for (var review in reviewData) await db.insert('REVIEW', review);
    },
  );
}

Future<Database> closeDb() {
  Database db;
  return db.close();
}

Future<List<Product>> getProducts(
    Future<Database> db, String categoryName) async {
  Database database = await db;
  final List<Map<String, dynamic>> maps = await database
      .rawQuery('SELECT * FROM Product WHERE category= "$categoryName"');

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

Future<List<Review>> getReviews(Future<Database> db, int productid) async {
  Database database = await db;
  final List<Map<String, dynamic>> maps = await database
      .rawQuery('SELECT*FROM REVIEW WHERE product_id="$productid"');
  print('${maps.length} $productid rows returned');
  return List.generate(maps.length, (i) {
    var map = maps[i];
    return Review(
      productid: map['product_id'],
      id: map['id'],
      spciyLevel: map['spciy_level'],
      saltyLevel: map['salty_level'],
      sweetLevel: map['sweet_level'],
      contentGood: map['content_good'],
      contentBad: map['content_bad'],
      contentKick: map['content_kick'],
      rating: map['rating'],
    );
  });
  // for (Map map in reviews) {
  //   returnreview.add(map);
  //   print(returnreview);
  // }
  // return returnreview;
}
