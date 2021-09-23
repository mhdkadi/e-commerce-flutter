class Product {
  String title;
  String shortDescription;
  String description;
  String id;
  String price;
  List categories;
  String imageUrl;
  Product(
      {required this.title,
      required this.shortDescription,
      required this.description,
      required this.id,
      required this.price,
      required this.categories,
      required this.imageUrl});
}
