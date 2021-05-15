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
    "Url": "https://smartstore.naver.com/foodasb/products/4797604813?NaPm=ct%3Dkop4quxs%7Cci%3D222bf9f8130744f85e0a40f13e2d1b43b8202748%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3Dbb7027185587782c2a57a6d4be1fc3add841ce64",
  },
];

List<Map<String, dynamic>> productData = [
  {
    'id': 1,
    'name': '우삼겹 순두부찌개',
    'company_name': '[프레시지]',
    'serving_size' : 2,
    'price': 7900,
    'discounted_price': 7000,
    'image_path': 'assets/images/FoodPictures/KoreanFood_list/KoreanFood_1.jpeg',
    'page_url': 'https://fresheasy.co.kr/goods/view?no=260'
  },
  /*
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
    "Url": "https://smartstore.naver.com/foodasb/products/4797604813?NaPm=ct%3Dkop4quxs%7Cci%3D222bf9f8130744f85e0a40f13e2d1b43b8202748%7Ctr%3Dslsl%7Csn%3D549704%7Chk%3Dbb7027185587782c2a57a6d4be1fc3add841ce64",
  },
  */
];


List<Map<String, dynamic>> reviewData = [
  {
    'product_id': 1,
    'id': 1,
    'content': '정말 맛있어요~',
    'rating': 4.5
  }
];