import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/categorie.dart';
import 'package:green_plate/src/presentation/features/products/views/product_list_screen.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/simple_card_image.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: primaryLightColor[300],
                radius: 23,
                child: Icon(
                  Icons.place_outlined,
                  color: ThemeColors.backGroundColor,
                  size: 24,
                ),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Sua Localização'), Text('Av. Afonso Pena, 133')],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: ThemeColors.primaryFontColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xFFF0F1F2),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Busque qualquer coisa...',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 20,
                        color: ThemeColors.primaryFontColor,
                      ),
                      onPressed: () => _searchController.clear(),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: ThemeColors.primaryFontColor,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height - 100),
              child: CardListWidget(
                cardItems: List.generate(
                  categories.length,
                  (index) => SimpleCardImageWidget(
                      title: categories[index].title,
                      imageAsset: categories[index].imageAsset,
                      nextPage: () => nextPage(context)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListScreen()));
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
