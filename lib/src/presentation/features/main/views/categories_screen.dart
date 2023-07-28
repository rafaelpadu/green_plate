import 'package:flutter/material.dart';
import 'package:green_plate/src/domain/model/categorie.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';

import '../../../widgets/data_driven/simple_card_image.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: CardListWidget(
          cardItems: List.generate(
              categories.length,
              (index) => SimpleCardImageWidget(
                  title: categories[index].title,
                  imageAsset: categories[index].imageAsset,
                  nextPage: () => nextPage())),
        ),
      ),
    );
  }

  void nextPage() {
    print("Bateu categories screen");
  }
}

List<Categorie> categories = [
  Categorie(title: 'Frutos e Vegetais', imageAsset: 'lib/res/assets/images/categories/fruits.png'),
  Categorie(title: 'Café da Manhã', imageAsset: 'lib/res/assets/images/categories/breakfast.png'),
  Categorie(title: 'Bebidas', imageAsset: 'lib/res/assets/images/categories/beveares.png'),
  Categorie(title: 'Carnes e Peixes', imageAsset: 'lib/res/assets/images/categories/meat.png'),
  Categorie(title: 'Lanches', imageAsset: 'lib/res/assets/images/categories/chips.png'),
  Categorie(title: 'Laticínios', imageAsset: 'lib/res/assets/images/categories/milk.png'),
];
