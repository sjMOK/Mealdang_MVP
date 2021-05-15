List<Map<String, String>> foodData = [
  {
    "cid": "2",
    "title": "[프레시지] 장흥회관 낙지곱창전골",
    "person" : "(2인분)",
    "price": "26900",
    "review": "7",
    "rating" : "4.4",
    "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_2.jpeg",
    "Url": "https://shopping.naver.com/fresh/homemeal/stores/100069073/products/5301558235?NaPm=ct%3Dkop4q2e0%7Cci%3D3f0e2038ced5b70522a266b6cbf8935cb7144718%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D0c72e350c4aa5a128d112c3e46d15c1c062df302"
  },
  {
    "cid": "3",
    "title": "[마이셰프] 인생 닭갈비",
    "person" : "(2인분)",
    "price": "11900",
    "review": "7",
    "rating" : "4.6",
    "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_3.jpeg",
    "Url": "https://shopping.naver.com/fresh/homemeal/stores/100073657/products/4858796389?NaPm=ct%3Dkop4nyrs%7Cci%3D3b7ea4f7052a4f76a20c8a2f60a2c32d0250a879%7Ctr%3Dslsl%7Csn%3D458431%7Chk%3D18680b5651286d29ededff914faec71a2aad7598"
  },
  {
    "cid": "4",
    "title": "[삼삼해물] 꽃개&새우 해물탕",
    "person" : "(2인분)",
    "price": "15800",
    "review": "7",
    "rating" : "4.3",
    "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_4.jpeg",
    "Url": "https://shopping.naver.com/fresh/homemeal/stores/100565794/products/4735056755?NaPm=ct%3Dkof823yo%7Cci%3D37a83728379270b3ecc0302ebc3deebe89a1e2a0%7Ctr%3Dslsl%7Csn%3D619584%7Chk%3D588da5f0f9c75e3e26b3bc6584bca65183eadfd9",
  },
  {
    "cid": "5",
    "title": "[푸드어셈블] 기승전골 곱창전골",
    "person" : "(2인분)",
    "price": "25900",
    "review": "7",
    "rating" : "4.5",
    "image": "assets/images/FoodPictures/KoreanFood_list/KoreanFood_5.jpeg",
    "Url": "https://shopping.naver.com/fresh/homemeal/stores/100103056/products/3486202527?NaPm=ct%3Dkopew668%7Cci%3Ddb6b3aa92e39efcdbaab3a347eeb3d73fc6bc542%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D1baa6fbda6a1ae251b900f7e1720c1cfc875c105",
  },
];

List<Map<String, dynamic>> productData = [
  {
    'id': 1,
    'category': 'koreanFood',
    'name': '우삼겹 순두부찌개',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 7900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_1.jpeg',
    'page_url': 'https://smartstore.naver.com/fresheasy/products/3492801816?NaPm=ct%3Dkopda9ao%7Cci%3D9c65b7193081b19180f5e04763c182fadb70adf0%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D50e1a2f281d528cc80f106ca4a71555dcd6c5b78'
  },
  {
    'id': 2,
    'category': 'koreanFood',
    'name': '장흥회관 낙지곱창전골',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 26900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_2.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/5301558235?NaPm=ct%3Dkop4q2e0%7Cci%3D3f0e2038ced5b70522a266b6cbf8935cb7144718%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D0c72e350c4aa5a128d112c3e46d15c1c062df302'
  },
  {
    'id': 3,
    'category': 'koreanFood',
    'name': '인생닭갈비',
    'company_name': '마이셰프',
    'serving_size' : 2,
    'price': 19800,
    'discounted_price': 14900,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_3.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100073657/products/4858796389?NaPm=ct%3Dkopdo95k%7Cci%3D04b680744c9d8e3fc8fee2653baf193c05162823%7Ctr%3Dslsl%7Csn%3D458431%7Chk%3Dcb5a32767aba7c0780a2e06584ff076206bbf2a8'
  },
  {
    'id': 4,
    'category': 'koreanFood',
    'name': '꽃게&새우 해물탕',
    'company_name': '삼삼해물',
    'serving_size' : 2,
    'price': 19800,
    'discounted_price': 15800,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_4.jpeg',
    'page_url': 'https://smartstore.naver.com/samsamheamul/products/4714276510?NaPm=ct%3Dkopdprxs%7Cci%3Ddbc8263ef2abbde6f3367dbd278d64b91101bd15%7Ctr%3Dslsl%7Csn%3D619584%7Chk%3D40ed90aa4943a1c39226aaa93fa014c27eb3f0de'
  },
  {
    'id': 5,
    'category': 'koreanFood',
    'name': '기승전골 곱창전골',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 25900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_5.jpeg',
    'page_url': 'https://smartstore.naver.com/foodasb/products/4797604813?NaPm=ct%3Dkopdrho0%7Cci%3D99de55e649c8e134801408242b46e4ab39b76786%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3Df2382cc67fd9ef4336b02557e71a1ad24f58b993'
  },
  {
    'id': 6,
    'category': 'koreanFood',
    'name': '연남동 통삼겹 김치찌개',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 13900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_6.jpeg',
    'page_url': 'https://smartstore.naver.com/foodasb/products/4912014692?NaPm=ct%3Dkopdtla8%7Cci%3D742e5b78f359a3051c509fae5a306b6685bf0f3d%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D364f616488878e8439478b30d382ee33081f4c8d'
  },
  {
    'id': 7,
    'category': 'koreanFood',
    'name': '통낙지가 3마리나 들어간 연포탕',
    'company_name': '맛수러움 방포수',
    'serving_size' : 2,
    'price': 22900,
    'discounted_price': 19900,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_7.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100248308/products/4774864842?NaPm=ct%3Dkope0ooo%7Cci%3Dd95b5fb5f3a595d9c31f1a30495034122efd2714%7Ctr%3Dslsl%7Csn%3D353173%7Chk%3Da19b0d2e68cbdb0361c95dea48610d50c841f9e3'
  },
  {
    'id': 8,
    'category': 'koreanFood',
    'name': '우삼겹 부대찌개',
    'company_name': '앙트레',
    'serving_size' : 2,
    'price': 14900,
    'discounted_price': 12900,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_8.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100101350/products/4699538776?NaPm=ct%3Dkope4jko%7Cci%3D53381f448e0044c835699ccaf12e390af95370f6%7Ctr%3Dslsl%7Csn%3D529390%7Chk%3Dc47cf095d1e5020071c04b474736d5401d0b9a9f'
  },
  {
    'id': 9,
    'category': 'koreanFood',
    'name': '화요옥 (얼큰) 꽃만두전골',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 15900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_9.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100103056/products/4901254379?NaPm=ct%3Dkope97s8%7Cci%3D9ac7ef3bb83cff97454b2e453cc39698274aafd3%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D246c6a23035a0f7b608f0c9a516687c2028c5b84'
  },
  {
    'id': 10,
    'category': 'koreanFood',
    'name': '안방에서 즐기는 ~ 안동시장 찜닭',
    'company_name': '아내의쉐프',
    'serving_size' : 2,
    'price': 18000,
    'discounted_price': 12900,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_10.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100073444/products/2600529037?NaPm=ct%3Dkopebbeg%7Cci%3D4121a529d32020a63914031d384c9e07d05606d9%7Ctr%3Dslsl%7Csn%3D398462%7Chk%3D63ef6dfed036175cac565206610eb4cdd2e52f2b'
  },
  {
    'id': 11,
    'category': 'chineseFood',
    'name': '해물누룽지탕',
    'company_name': '앙트레',
    'serving_size' : 2,
    'price': 15900,
    'discounted_price': 13900,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_1.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100101350/products/3492836799?NaPm=ct%3Dkopeegts%7Cci%3D310ba1a2c3a206ff11aa0ee11673d7f07c83d8ed%7Ctr%3Dslsl%7Csn%3D529390%7Chk%3Db1134e14c201f16b32435e247c6d39e05841d7df'
  },
  {
    'id': 12,
    'category': 'chineseFood',
    'name': '양장피 밀키트',
    'company_name': '마이셰프',
    'serving_size' : 2,
    'price': 20000,
    'discounted_price': 13900,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_2.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100073657/products/2246511992?NaPm=ct%3Dkopehpc8%7Cci%3D60799d7d17d4f56b9f034566d0a2739b5f3c1640%7Ctr%3Dslsl%7Csn%3D458431%7Chk%3D34d8109a3819ad950843d5aca8982a8327572189'
  },
  {
    'id': 13,
    'category': 'chineseFood',
    'name': '5분완성 마라탕 밀키트',
    'company_name': '프로즌',
    'serving_size' : 1,
    'price': 11900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_3.jpeg',
    'page_url': 'https://smartstore.naver.com/frozenes/products/4596972442?NaPm=ct%3Dkopeiv08%7Cci%3D39a4987eb433e2fc4569f542c79e0313346b9a5e%7Ctr%3Dslsl%7Csn%3D876417%7Chk%3D3b0b264d9d6cc58a6e455dab115afb772ec25de3'
  },
  {
    'id': 14,
    'category': 'chineseFood',
    'name': '지동관 깐쇼새우',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 14900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_4.jpeg',
    'page_url': 'https://smartstore.naver.com/fresheasy/products/5301576003?NaPm=ct%3Dkopekek8%7Cci%3D52648be50c852374855925def111508e6a75fc52%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Df74a88109b7e92380e2b5e1509397cb506e975ea'
  },
  {
    'id': 15,
    'category': 'chineseFood',
    'name': '사천식 고추잡채 밀키트',
    'company_name': '아내의 쉐프',
    'serving_size' : 2,
    'price': 16000,
    'discounted_price': 10900,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_5.jpeg',
    'page_url': 'https://smartstore.naver.com/wifechef/products/649530756?NaPm=ct%3Dkopem8x4%7Cci%3D30c060fa609769de1ee409141c834708c1df0565%7Ctr%3Dslsl%7Csn%3D398462%7Chk%3Da28b8a3020d47b3a8c2111537f8b9d738a670704'
  },
  {
    'id': 16,
    'category': 'chineseFood',
    'name': '백리향 마파두부',
    'company_name': '프레시지',
    'serving_size' : 3,
    'price': 15900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_6.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/5301793406?NaPm=ct%3Dkopennug%7Cci%3Df5d9c2de53363438d333d584dc7c60923d395e5c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D2e06afa134de24d9dc87402c139b6342cb61ae5b'
  },
  {
    'id': 17,
    'category': 'chineseFood',
    'name': '중독적인 마라샹궈',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 17900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_7.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100103056/products/3486202527?NaPm=ct%3Dkopesyfk%7Cci%3Ddef16d24b7077f4d050770a15787874a3a53ba1b%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D8e93015fdae5565353507b4813df7b8c119dfe48'
  },
  {
    'id': 18,
    'category': 'chineseFood',
    'name': '백리향 난자완스',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 22900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_8.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/5301760615?NaPm=ct%3Dkopf1tvk%7Cci%3D6cf69d20face2d4fdeda0d5fd40660591e70413c%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Dcdcb43b6ef53ab4e48bf16ac99d68ff8950bc0d9'
  },
  {
    'id': 19,
    'category': 'chineseFood',
    'name': '어향가지 밀키트',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 15900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_9.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/5390746157?NaPm=ct%3Dkopfh0y0%7Cci%3Ddff5174e4363e6a797c44c1181dfb7cdb64746b4%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3Dd9fb4fd2c93fd2288e405d94bf297854525a27b2'
  },
  {
    'id': 20,
    'category': 'chineseFood',
    'name': '새우 완자탕',
    'company_name': '식스레시피',
    'serving_size' : 2,
    'price': 9900,
    'discounted_price': 8900,
    'image_path': 'assets/images/FoodPictures/ChineseFood_list/ChineseFood_10.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100068524/products/4952400382?NaPm=ct%3Dkopfiszk%7Cci%3Dd3459c503a0f289011d3185cd45a50dacc4bc9fc%7Ctr%3Dslsl%7Csn%3D448202%7Chk%3D6fbe2aed09df0124ad98fda47117c7fbe6afd040'
  },
  {
    'id': 21,
    'category': 'westernFood',
    'name': '봉골레 크림 빠네 파스타',
    'company_name': '애슐리 쉐프박스',
    'serving_size' : 2,
    'price': 17900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_1.jpeg',
    'page_url': 'https://smartstore.naver.com/elandparkfood/products/4872736184?NaPm=ct%3Dkopfnndc%7Cci%3D4b5474821c99b49abdacc27a64a16c84a1799d30%7Ctr%3Dslsl%7Csn%3D523150%7Chk%3De3ff7900bde5ae87818081f17d693e2a2c9a8f17'
  },
  {
    'id': 22,
    'category': 'westernFood',
    'name': '짐승파스타 월터 감바스',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 15900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_2.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100103056/products/5404760975?NaPm=ct%3Dkopfqppk%7Cci%3D184344888dccb2f6f56e9473df5d1b2f9daba32c%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D46425210f8c0ca734a4f709570aa8ac63fc38cc4'
  },
  {
    'id': 23,
    'category': 'westernFood',
    'name': '소고기 찹스테이크',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 10900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_3.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2263984222?NaPm=ct%3Dkopfrnns%7Cci%3D4a83e4cc9edc18c127953c79f46468beec16e918%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D626f382c6486fe5d573784fbfb637e1dd23c6884'
  },
  {
    'id': 24,
    'category': 'westernFood',
    'name': '블랙페퍼 스테이크',
    'company_name': '아내의 쉐프',
    'serving_size' : 2,
    'price': 21000,
    'discounted_price': 12900,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_4.jpeg',
    'page_url': 'https://smartstore.naver.com/wifechef/products/4762670456?NaPm=ct%3Dkopfsd4g%7Cci%3D1246f67c2d8a31afba41ab283ff083c0b6077511%7Ctr%3Dslsl%7Csn%3D398462%7Chk%3D24e58452323c39cb7e14a6955e955ef8e12b4466'
  },

  {
    'id': 25,
    'category': 'westernFood',
    'name': '불고기 빠네크림파스타',
    'company_name': '푸드어셈블',
    'serving_size' : 2,
    'price': 14900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_5.jpeg',
    'page_url': 'https://smartstore.naver.com/foodasb/products/4516137985?NaPm=ct%3Dkopftexk%7Cci%3Da5ebf363f2552bf61d0e3c7775b09d08f42eed27%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3D296315f5bdd0ac9a93bf4eda39a11ad65d1a4ae2'
  },
  {
    'id': 26,
    'category': 'westernFood',
    'name': '감바스 & 알리오 올리오 파스타 밀키트[곡물빵증정]',
    'company_name': '아내의 쉐프',
    'serving_size' : 2,
    'price': 14900,
    'discounted_price': 12990,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_6.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100073444/products/2281473037?NaPm=ct%3Dkopfuwy0%7Cci%3D1b61a1066ef40796a654218486d641a305f27d7c%7Ctr%3Dslsl%7Csn%3D398462%7Chk%3D1611cc694930502a7600fcd5a4cb129fac9926c1'
  },
  {
    'id': 27,
    'category': 'westernFood',
    'name': '치즈러버 멕시칸 포테이토',
    'company_name': '애슐리 쉐프박스',
    'serving_size' : 2,
    'price': 12900,
    'discounted_price': 9900,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_7.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100359417/products/4596514722?NaPm=ct%3Dkopfxbd4%7Cci%3De7b250e63d767b18f4907e3cfc9126eeb7060cf6%7Ctr%3Dslsl%7Csn%3D523150%7Chk%3D9ab8ae54c050f70329ca78b73c5ec15acb059582'
  },
  {
    'id': 28,
    'category': 'westernFood',
    'name': '자이언트 미트볼 파스타',
    'company_name': '프레시지',
    'serving_size' : 2,
    'price': 12900,
    'discounted_price': null,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_8.jpeg',
    'page_url': 'https://shopping.naver.com/fresh/homemeal/stores/100069073/products/2972607714?NaPm=ct%3Dkopfyy08%7Cci%3Ddcb62e52c325873dcd06bf40cee52f79eced7588%7Ctr%3Dslsl%7Csn%3D446884%7Chk%3D0485781b62eb54e35e30ca8c6899892b2286e9c4'
  },
  {
    'id': 29,
    'category': 'westernFood',
    'name': '레드와인스테이크',
    'company_name': '마이셰프',
    'serving_size' : 2,
    'price': 23000,
    'discounted_price': 16900,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_9.jpeg',
    'page_url': 'https://smartstore.naver.com/recipebox_mychef/products/3069582988?NaPm=ct%3Dkopg06rc%7Cci%3D8f6805faeafa3a54ff4838b88e0d7fe137626093%7Ctr%3Dslsl%7Csn%3D458431%7Chk%3Dc1e7259052723c66176a083bfc1bee48b431df1e'
  },
  {
    'id': 30,
    'category': 'westernFood',
    'name': '보일링 랍스터 크랩 밀키트',
    'company_name': '피셔맨즈',
    'serving_size' : 2,
    'price': 72000,
    'discounted_price': 55000,
    'image_path': 'assets/images/FoodPictures/WesternFood_list/WesternFood_10.jpeg',
    'page_url': 'https://smartstore.naver.com/fishermans/products/5253312263?NaPm=ct%3Dkopg2adk%7Cci%3D71644013ccac3644b9538dc92a3914af50deb085%7Ctr%3Dslsl%7Csn%3D1201396%7Chk%3D61a24d614325802fc449af784435ecdd8979b970'
  },
];


List<Map<String, dynamic>> reviewData = [
  {
    'product_id': 1,
    'id': 1,
    'content': '정말 맛있어요~',
    'rating': 4
  }
];