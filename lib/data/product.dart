class Product {
  int id;
  String category;
  String name;
  String companyName;
  int servingSize;
  int price;
  int discountedPrice;
  String imagePath;
  String pageUrl;
  int reviewCount;
  num rating;

  Product({
    this.id,
    this.category,
    this.name,
    this.companyName,
    this.servingSize,
    this.price,
    this.discountedPrice,
    this.imagePath,
    this.pageUrl,
    this.reviewCount,
    this.rating
  });
}
