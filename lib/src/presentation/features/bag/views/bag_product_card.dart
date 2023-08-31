import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/product.dart';
import 'package:green_plate/src/utils/case_formatters.dart';

class BagProductCard extends StatefulWidget {
  const BagProductCard({super.key, required this.product});
  final Product product;
  @override
  State<BagProductCard> createState() => _BagProductCardState();
}

class _BagProductCardState extends State<BagProductCard> {
  int qtyRequested = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.product.imageUrl,
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.productDescription,
                    style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
                  ),
                  Text(
                    CaseFormatters().currencyBRLFormatter(widget.product.productValue),
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
                  onTap: addQtyProduct,
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
                  qtyRequested.toString(),
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Material(
                color: ThemeColors.errorColor,
                borderRadius: BorderRadius.circular(7),
                child: InkWell(
                  onTap: rmQtyProduct,
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

  addQtyProduct() {
    setState(() {
      qtyRequested++;
    });
  }

  rmQtyProduct() {
    if (qtyRequested > 0) {
      setState(() {
        qtyRequested--;
      });
    }
  }
}
