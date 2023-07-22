import 'package:flutter/material.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/sale_product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<SaleProductCard> saleProductList = [
    const SaleProductCard(
      imageUrl: 'lib/res/assets/images/products/contra_file.jpg',
      productValue: 29.50,
      productDescription: 'Contra Filé - Kg',
      productId: 1,
    ),
    const SaleProductCard(
      imageUrl: 'lib/res/assets/images/products/peixe.jpg',
      productValue: 18.99,
      productDescription: 'Postas de Cação - 800g',
      productId: 2,
    ),
    const SaleProductCard(
      imageUrl: 'lib/res/assets/images/products/contra_file.jpg',
      productValue: 29.50,
      productDescription: 'Contra Filé - Kg',
      productId: 1,
    ),
    const SaleProductCard(
      imageUrl: 'lib/res/assets/images/products/peixe.jpg',
      productValue: 18.99,
      productDescription: 'Postas de Cação - 800g',
      productId: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carnes e Peixes'),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: CardListWidget(
              cardItems: saleProductList,
              onPressed: (item) => print(item),
            )
            // List.generate((saleProductList.length / 2).ceil(), (index) => saleProductList[index]),
            ),
      ),
    );
  }
}
