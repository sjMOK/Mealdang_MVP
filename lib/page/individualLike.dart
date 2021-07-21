import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/utils/util.dart';

class IndividualLike extends StatefulWidget {
  @override
  _IndividualLikeState createState() => _IndividualLikeState();
}

class _IndividualLikeState extends State<IndividualLike> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Image.asset(
              'assets/images/logo/logo_appbar.png',
              height: 40.h,
              fit: BoxFit.contain,
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Colors.amber, //main컬러로 바꾸기
              tabs: [
                Text(
                  "찜한 상품",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  "최근 본 상품",
                  style: TextStyle(
                    fontFamily: "NotoSans",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: LikedBuilder(),
              ),
              Tab(
                text: "2",
              ),
            ],
          )),
    );
  }
}

class LikedBuilder extends StatefulWidget {
  @override
  _LikedBuilderState createState() => _LikedBuilderState();
}

class _LikedBuilderState extends State<LikedBuilder> {
  Future<List<Product>> _likeProducts;
  DBHelper _dbHelper = DBHelper();
  @override
  void initState() {
    super.initState();
    _likeProducts = getLike(_dbHelper.db);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _likeProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data.length);
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return ProductCard(
                      snapshot.data[index], 40.w, _dbHelper, true);
                },
              );
            } else
              return Text('찜한 상품이 없습니다.');
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                MAINCOLOR,
              ),
            ),
          );
        });
  }
}

class RecentlyViewedBuilder extends StatefulWidget {
  @override
  _RecentlyViewedBuilderState createState() => _RecentlyViewedBuilderState();
}

class _RecentlyViewedBuilderState extends State<RecentlyViewedBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
