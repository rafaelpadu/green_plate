// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String imageUrl;
  String productDescription;
  int productId;
  double productValue;
  double discount;
  Product({
    required this.imageUrl,
    required this.productValue,
    required this.productDescription,
    required this.productId,
    required this.discount,
  });
}
