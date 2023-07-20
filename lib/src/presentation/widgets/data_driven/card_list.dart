// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final List<Widget> cardItems;
  const CardListWidget({
    Key? key,
    required this.cardItems,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cardItems[primeiroItem],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cardItems[segundoItem],
                ),
              )
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: cardItems[primeiroItem],
        );
      }),
    );

    // return List.generate<Widget>(itemBuilder: (context, index) {
    //   final primeiroItem = index * 2;
    //   final segundoItem = primeiroItem + 1;
    //   final bool temSegundoItem = segundoItem < cardItems.length;
    //   if (temSegundoItem) {
    //     return Row(
    //       children: [
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: cardItems[primeiroItem],
    //           ),
    //         ),
    //         Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: cardItems[segundoItem],
    //           ),
    //         )
    //       ],
    //     );
    //   }
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: cardItems[primeiroItem],
    //   );
    // });
  }
}
