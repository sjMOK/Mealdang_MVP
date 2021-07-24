import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealdang_mvp/data/product.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/page/productDetail.dart';
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
  DBHelper _dbHelper = DBHelper();
  var data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<LikeControllerWithGetx>(
      init: LikeControllerWithGetx(),
      builder: (controller) {
        controller.init(true, _dbHelper);
        return FutureBuilder(
          future: controller.likeList.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print("연결성공");
              if (snapshot.hasData) {
                print(snapshot.data.length);
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.7.w),
                  itemBuilder: (context, index) {
                    return productCard(snapshot.data[index], width * 0.3);
                  },
                );
              }
              return Text('찜한 상품이 없습니다.');
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  MAINCOLOR,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget productCard(Product product, double width) {
    return Container(
      width: width * 0.33,
      margin: EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(0.0),
          elevation: 0.0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: LikeOverImage(product, true, _dbHelper, width),
                ),
                Text(
                  '[${product.companyName}]',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 8.sp,
                      color: Colors.grey[700]),
                ),
                Text(
                  '${product.name}',
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
