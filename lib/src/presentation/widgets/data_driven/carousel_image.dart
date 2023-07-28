// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  const CarouselImage({Key? key, required this.imageUrl, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: width,
      ),
    );
  }
}
