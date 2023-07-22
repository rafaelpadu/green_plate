import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class SaleProductCard extends StatelessWidget {
  const SaleProductCard({
    super.key,
    required this.imageUrl,
    required this.productValue,
    required this.productDescription,
    required this.productId,
  });
  final String imageUrl;
  final double productValue;
  final String productDescription;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 257, maxHeight: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl),
              Text(
                productDescription,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "R\$ $productValue",
                  style: TextStyle(
                    color: ThemeColors.secondary,
                    fontSize: 16,
                    fontWeight: pesosDeFonte['medium'],
                  ),
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                color: ThemeColors.primary,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: ThemeColors.whiteFontColor,
                          size: 14,
                        ),
                        Text(
                          "Adicionar à Sacola",
                          style: TextStyle(color: ThemeColors.whiteFontColor, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
