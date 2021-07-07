import 'package:intl/intl.dart';
import 'dart:math';
import 'package:flutter/material.dart';

String setPriceFormat(int price) {
  final oCcy = new NumberFormat("#,###", "ko_KR");
  return "${oCcy.format(price)}원";
}

String getRandomName() {
  List<String> prefix = [
    '인색한',
    '상큼한',
    '톡쏘는',
    '총명한',
    '우직한',
    '든든한',
    '도도한',
    '한가한',
    '눈부신',
    '차가운',
    '예민한',
    '둔감한',
    '똑똑한',
    '미적인',
    '불안한',
    '비옥한',
    '화려한',
    '무안한',
    '무엄한',
    '무서운'
  ];
  List<String> suffix = [
    '문지기',
    '악어새',
    '빌딩숲',
    '아이돌',
    '붕어빵',
    '병따개',
    '키보드',
    '먹구름',
    '아수라',
    '빅이어',
    '봉무게',
    '물티슈',
    '가우스',
    '고사리',
    '내무반',
    '돌덩이',
    '파라오',
    '마틸다',
    '백일홍',
    '솔로몬'
  ];

  var rng = new Random();
  int preIdx, sufIdx;

  preIdx = rng.nextInt(10);
  sufIdx = rng.nextInt(20);

  return '${prefix[preIdx]} ${suffix[sufIdx]}';
}

const Color MAINCOLOR = Color.fromRGBO(255, 156, 30, 1);
