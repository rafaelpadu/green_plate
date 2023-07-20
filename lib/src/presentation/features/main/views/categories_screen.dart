import 'package:flutter/material.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';

import '../../../widgets/data_driven/card_image.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: CardListWidget(cardItems: _categories),
      ),
    );
  }
}

List<Widget> _categories = [
  const CardImageWidget(title: 'Frutos e Vegetais', imageAsset: 'lib/res/assets/images/categories/fruits.png'),
  const CardImageWidget(title: 'Café da Manhã', imageAsset: 'lib/res/assets/images/categories/breakfast.png'),
  const CardImageWidget(title: 'Bebidas', imageAsset: 'lib/res/assets/images/categories/beveares.png'),
  const CardImageWidget(title: 'Carnes e Peixes', imageAsset: 'lib/res/assets/images/categories/meat.png'),
  const CardImageWidget(title: 'Lanches', imageAsset: 'lib/res/assets/images/categories/chips.png'),
  const CardImageWidget(title: 'Laticínios', imageAsset: 'lib/res/assets/images/categories/milk.png'),
];
