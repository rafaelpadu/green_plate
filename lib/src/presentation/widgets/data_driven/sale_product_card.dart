import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class SaleProductCard extends StatelessWidget {
  const SaleProductCard(
      {super.key,
      required this.imageUrl,
      required this.productValue,
      required this.productDescription,
      required this.productId,
      required this.addToCart,
      required this.productPage,
      required this.storeName});
  final String imageUrl;
  final double productValue;
  final String productDescription;
  final String storeName;
  final int productId;
  final Function() addToCart;
  final Function() productPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 257, maxHeight: 320),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: productPage,
                child: Image.network(
                  imageUrl,
                  width: 200,
                  height: 185,
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
              ),
              Text(
                productDescription,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.storefront_outlined,
                    size: 16,
                  ),
                  Expanded(
                    child: Text(
                      storeName,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "R\$ ${productValue.toStringAsFixed(2).replaceAll('.', ',')}",
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
                  onTap: addToCart,
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
