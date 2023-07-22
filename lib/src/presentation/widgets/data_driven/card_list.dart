// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:green_plate/src/presentation/features/products/views/product_list_screen.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_image.dart';

class CardListWidget extends StatelessWidget {
  final List<Widget> cardItems;
  final Function(Widget item) onPressed;
  const CardListWidget({
    Key? key,
    required this.cardItems,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate((cardItems.length / 2).ceil(), (index) {
        final primeiroItem = index * 2;
        final segundoItem = primeiroItem + 1;
        final bool temSegundoItem = segundoItem < cardItems.length;
        if (temSegundoItem) {
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    onPressed(cardItems[primeiroItem]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardItems[primeiroItem],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // nextPage(cardItems[segundoItem], context);
                    onPressed(cardItems[segundoItem]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: cardItems[segundoItem],
                  ),
                ),
              )
            ],
          );
        }
        return GestureDetector(
          onTap: () {
            // nextPage(cardItems[primeiroItem], context);
            onPressed(cardItems[segundoItem]);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: cardItems[primeiroItem],
          ),
        );
      }),
    );
  }
}
