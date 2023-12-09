import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class StoreCardImage extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String storeType;
  final String storeName;
  final Function() goToStorePage;
  const StoreCardImage({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.storeType,
    required this.storeName,
    required this.goToStorePage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToStorePage,
      child: SizedBox(
        width: 255,
        height: 255,
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Image.network(
                imageUrl,
                width: 140,
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
                  width: 140,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            storeName,
                            style: TextStyle(fontWeight: pesosDeFonte['medium']),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            rating.toString(),
                            style: const TextStyle(color: Colors.yellow, fontSize: 10),
                          ),
                        ),
                        Text(
                          "| $storeType ",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
