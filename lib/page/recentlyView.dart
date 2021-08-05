import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealdang_mvp/database/db.dart';
import 'package:mealdang_mvp/page/homePage.dart';
import 'package:mealdang_mvp/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentlyViewedBuilder extends StatefulWidget {
  @override
  _RecentlyViewedBuilderState createState() => _RecentlyViewedBuilderState();
}

class _RecentlyViewedBuilderState extends State<RecentlyViewedBuilder> {
  DBHelper _dbHelper = new DBHelper();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<RecentViewController>(
      id: 'recentPage',
      init: RecentViewController(),
      builder: (controller) {
        controller.dataInit(_dbHelper);
        print("update recent page");
        return FutureBuilder(
          future: controller.recentViewList.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1.w,
                      childAspectRatio: 0.6.w),
                  itemBuilder: (context, index) {
                    return ProductCard(snapshot.data[index], width * 0.3, 120.w,
                        30.sp, Colors.white);
                  },
                );
              }
              return Text('최근 본 상품이 없습니다.');
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
}
