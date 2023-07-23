import 'package:flutter/material.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';

import '../../../widgets/data_driven/simple_card_image.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SimpleCardImageWidget> categories = [
      const SimpleCardImageWidget(
          title: 'Frutos e Vegetais', imageAsset: 'lib/res/assets/images/categories/fruits.png'),
      const SimpleCardImageWidget(title: 'Café da Manhã', imageAsset: 'lib/res/assets/images/categories/breakfast.png'),
      const SimpleCardImageWidget(title: 'Bebidas', imageAsset: 'lib/res/assets/images/categories/beveares.png'),
      const SimpleCardImageWidget(title: 'Carnes e Peixes', imageAsset: 'lib/res/assets/images/categories/meat.png'),
      const SimpleCardImageWidget(title: 'Lanches', imageAsset: 'lib/res/assets/images/categories/chips.png'),
      const SimpleCardImageWidget(title: 'Laticínios', imageAsset: 'lib/res/assets/images/categories/milk.png'),
    ];
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: CardListWidget(
          cardItems: categories,
          onPressed: (item) => print(item),
        ),
      ),
    );
  }
}
