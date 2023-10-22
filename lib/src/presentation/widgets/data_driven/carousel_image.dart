// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  const CarouselImage({super.key, required this.imageUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        imageUrl,
        width: width,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'lib/res/assets/images/imagem_padrao.png',
          fit: BoxFit.cover,
          width: 230,
          height: 185,
        ),
      ),
    );
  }
}
