import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

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
          Image.asset(
            imageAsset,
            width: 145,
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
                      "R\$${realPrice.toString()}",
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
