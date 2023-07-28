import 'package:flutter/material.dart';
import 'package:green_plate/src/domain/model/product.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/sale_product_card.dart';

import 'product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carnes e Peixes'),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CardListWidget(
              cardItems: List.generate(saleProductList.length, (index) {
                Product product = saleProductList[index];
                return SaleProductCard(
                  imageUrl: product.imageUrl,
                  productValue: product.productValue,
                  productDescription: product.productDescription,
                  productId: product.productId,
                  addToCart: _addToCart,
                  productPage: _productPage,
                );
              }),
            )
            // List.generate((saleProductList.length / 2).ceil(), (index) => saleProductList[index]),
            ),
      ),
    );
  }

  void _addToCart() {
    print('ALou');
  }

  void _productPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductScreen(
          value: 45.56,
          productName: "Leite em Pó Integral Piracanjuba",
          weight: 400,
        ),
      ),
    );
  }
}

List<Product> saleProductList = [
  Product(
    imageUrl: 'lib/res/assets/images/products/contra_file.jpg',
    productValue: 29.50,
    productDescription: 'Contra Filé - Kg',
    productId: 1,
    discount: 0.0,
  ),
  Product(
    imageUrl: 'lib/res/assets/images/products/peixe.jpg',
    productValue: 18.99,
    productDescription: 'Postas de Cação - 800g',
    productId: 2,
    discount: 0.0,
  ),
  Product(
    imageUrl: 'lib/res/assets/images/products/contra_file.jpg',
    productValue: 29.50,
    productDescription: 'Contra Filé - Kg',
    productId: 1,
    discount: 0.0,
  ),
  Product(
    imageUrl: 'lib/res/assets/images/products/peixe.jpg',
    productValue: 18.99,
    productDescription: 'Postas de Cação - 800g',
    productId: 1,
    discount: 0.0,
  ),
];
