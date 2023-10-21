import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/utils/case_formatters.dart';

class ProductPriceCard extends StatelessWidget {
  const ProductPriceCard({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
    required this.discount,
  });
  final String imageAsset;
  final String productName;
  final double price;
  final double discount;
  @override
  Widget build(BuildContext context) {
    double realPrice = price - discount;
    return Container(
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(minHeight: 130, maxHeight: 135),
      child: Row(
        children: [
          Image.network(
            imageAsset,
            width: 80,
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
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    productName,
                    style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
                    maxLines: 2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (discount > 0.0)
                      Text(
                        "R\$${price.toString()}",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: pesosDeFonte['semi-bold'],
                            color: ThemeColors.primaryFontColor.withOpacity(0.54)),
                      ),
                    Text(
                      CaseFormatters().currencyBRLFormatter(realPrice),
                      style: TextStyle(
                        color: ThemeColors.secondary,
                        fontSize: 20,
                        fontWeight: pesosDeFonte['bold'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
