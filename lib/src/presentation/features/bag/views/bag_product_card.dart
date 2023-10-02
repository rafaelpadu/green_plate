import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/utils/case_formatters.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({
    super.key,
    required this.orderItem,
    required this.plusQty,
    required this.minusQty,
  });
  final OrderItemDTO orderItem;
  final Function() plusQty;
  final Function() minusQty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Image.network(
                  orderItem.stockDTO.productDTO.imageUrl,
                  width: 100,
                  height: 70,
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
                    width: 55,
                    height: 70,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.stockDTO.productDTO.name,
                    style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
                  ),
                  Text(
                    CaseFormatters().currencyBRLFormatter(orderItem.itemTotal),
                    style: TextStyle(
                      fontSize: 20,
                      color: ThemeColors.secondary,
                      fontWeight: pesosDeFonte['semi-bold'],
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              Material(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.circular(7),
                child: InkWell(
                  onTap: plusQty,
                  customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  orderItem.qtyRequested.toString(),
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Material(
                color: ThemeColors.errorColor,
                borderRadius: BorderRadius.circular(7),
                child: InkWell(
                  onTap: minusQty,
                  customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8.0, right: 8.0, bottom: 8.0),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
