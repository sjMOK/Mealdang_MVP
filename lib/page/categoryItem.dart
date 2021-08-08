import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mealdang_mvp/page/mealdangHome.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:mealdang_mvp/data/categoryData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'homePage.dart';

class CategoryItem extends StatefulWidget {
  final String categoryName;

  CategoryItem(this.categoryName);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  //Future<List<Product>> _products;
  DBHelper _dbHelper = DBHelper();
  SortProductController controller;
  // RecentViewController controller;
  @override
  void initState() {
    super.initState();
    controller = SortProductController();
    controller.dataInit(_dbHelper, widget.categoryName);
    //_products = getProducts(_dbHelper.db, widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 140.h,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          children: [
            Text(
              '${categoryData[widget.categoryName]['name']}',
              style: TextStyle(
                color: MAINCOLOR,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w700,
                fontSize: 32.sp,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(),
                _buildSortButton("별점 순", controller),
                SizedBox(width: 10.w),
                _buildSortButton("리뷰 순", controller),
                SizedBox(width: 10.w),
                _buildSortButton("가격 순", controller),
                SizedBox(width: 10.w),
                _buildSortButton("인분 순", controller),
              ],
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: _myListView(_dbHelper.db),
          ),
          Positioned(
            bottom: 20.h,
            right: -5.w,
            child: MaterialButton(
              height: 45.h,
              color: Colors.yellow,
              shape: CircleBorder(),
              child: Container(
                height: 35.h,
                width: 35.h,
                child: Center(
                  child: Image.asset('assets/images/ask_icon/chat.png'),
                ),
              ),
              onPressed: () {
                openKakaoAsking();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _myListView(Future<Database> database) {
    return GetBuilder<SortProductController>(
      init: controller,
      builder: (controller) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            Product product = controller.sortProductList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product),
                  ),
                );
              },
              child: _itemContainer(product, index),
            );
          },
          itemCount: controller.sortProductList.length,
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.grey),
        );
      },
    );
  }

  Widget _itemContainer(Product product, int index) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: Hero(
              tag: product.id, //product.id,
              child: Stack(
                children: [
                  Image.asset(
                    product.imagePath,
                    width: 131.w,
                    height: 131.w,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      bottom: 5.w,
                      right: 5.w,
                      child: LikeIcon(
                          product, _dbHelper, 30.w, Colors.white) //여기에 하트 생성
                      ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 131.w,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '[${product.companyName}]',
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  _buildPrice(product.price, product.discountedPrice),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          size: 20.sp,
                          color: Colors.amber[600],
                        ),
                        Text(
                          '${product.rating}',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 8.2.w),
                        Icon(
                          Icons.messenger_outline_rounded,
                          color: Colors.orange[800],
                          size: 20.sp,
                        ),
                        SizedBox(width: 4.1.w),
                        Text(
                          '${product.reviewCount}',
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSortButton(String sortType, SortProductController controller) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      side: BorderSide(width: 2, color: Colors.grey[400]),
    ),
    onPressed: () {
      switch (sortType) {
        case "별점 순":
          controller.sortByRatings();
          break;
        case "인분 순":
          controller.sortByServings();
          break;
        case "가격 순":
          controller.sortByPrices();
          break;
        case "리뷰 순":
          controller.sortByReview();
          break;
      }
    },
    child: Text(
      "$sortType",
      style: TextStyle(fontFamily: "Notosans", color: Colors.grey[400]),
    ),
  );
}

Container _buildPrice(int realPrice, int discountedPrice) {
  if (discountedPrice == null) {
    return Container(
      child: Text(
        setPriceFormat(realPrice),
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: Colors.red[600]),
      ),
    );
  } else {
    int discountedRate = ((1 - discountedPrice / realPrice) * 100).round();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Text(
                '$discountedRate%',
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(width: 7.w),
              Text(
                setPriceFormat(realPrice),
                style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.grey[400],
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          Text(
            setPriceFormat(discountedPrice),
            style: TextStyle(
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: Colors.red[600]),
          ),
        ],
      ),
    );
  }
}

class SortProductController extends GetxController {
  var productList = Future.value();
  var sortProductList = [].obs;
  void dataInit(DBHelper _dbHelper, String categoryName) async {
    productList = getProducts(_dbHelper.db, categoryName);
    sortProductList.addAll(await productList);
    print(sortProductList);
  }

  void sortByRatings() {
    sortProductList.sort((a, b) => b.rating.compareTo(a.rating));
    update();
  }

  void sortByReview() {
    sortProductList.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
    update();
  }

  void sortByPrices() {
    sortProductList.sort((a, b) => (b.discountedPrice ?? b.price)
        .compareTo((a.discountedPrice ?? a.price)));
    update();
  }

  void sortByServings() {
    sortProductList.sort((a, b) => (b.servingSize ?? 0)
        .compareTo(a.servingSize ?? 0)); //servingSize 없으면 null로 해놓음
    update();
  }
}
