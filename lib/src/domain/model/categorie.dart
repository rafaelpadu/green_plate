// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:green_plate/src/domain/enum/product_category.dart';

class Categorie {
  String title;
  String imageAsset;
  ProductCategory productCategory;
  Categorie({
    required this.title,
    required this.imageAsset,
    required this.productCategory,
  });
}
