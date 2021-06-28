import 'package:intl/intl.dart';

String setPriceFormat(int price) {
    final oCcy = new NumberFormat("#,###", "ko_KR");
    return "${oCcy.format(price)}원";
} // 가격 만원단위 형변환