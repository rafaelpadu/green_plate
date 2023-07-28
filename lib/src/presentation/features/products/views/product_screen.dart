// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/product.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/carousel_image.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/product_with_price_card.dart';

class ProductScreen extends StatefulWidget {
  final double value;
  final double? weight;
  final String productName;
  const ProductScreen({
    Key? key,
    required this.value,
    this.weight,
    required this.productName,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _indexPage = 0;
  List<String> images = [
    'lib/res/assets/images/products/leite_po_piracanjuba.jpg',
    'lib/res/assets/images/products/leite_po_italac.jpg',
  ];
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: controller,
                items: List.generate(images.length, (index) => CarouselImage(imageUrl: images[index], width: 400)),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _indexPage = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ...Iterable<int>.generate(images.length).map(
                      (int pageIndex) => Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: GestureDetector(
                          onTap: () => goToThisImage(controller, pageIndex),
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: _indexPage == pageIndex ? ThemeColors.primary : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: CarouselImage(
                              imageUrl: images[pageIndex],
                              width: 83,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.productName,
                    style:
                        TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 20, color: ThemeColors.blackFontColor),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.weight?.ceil()} g",
                      style: TextStyle(fontWeight: pesosDeFonte['bold'], fontSize: 29),
                    ),
                    Text(
                      "R\$${widget.value}",
                      style: TextStyle(
                        fontWeight: pesosDeFonte['bold'],
                        fontSize: 29,
                        color: ThemeColors.primary,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: [
                    const Icon(Icons.sort),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Produtos Lácteos',
                        style: TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  children: [
                    const Icon(Icons.menu),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Et quidem faciunt, ut summum bonum\nsit extremum et rationibus conquisitis\nde voluptate. Sed ut summum bonum \nsit id,',
                        style: TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(
                      'Produtos similares',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ...Iterable<int>.generate(_productList.length).map(
                (index) {
                  Product product = _productList[index];
                  return Column(
                    children: [
                      ProductPriceCard(
                        imageAsset: product.imageUrl,
                        productName: product.productDescription,
                        price: product.productValue,
                        discount: product.discount,
                      ),
                      Divider(
                        thickness: 2,
                        color: ThemeColors.dividerColor,
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: ThemeColors.primary,
                        borderRadius: BorderRadius.circular(7),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(),
                                Text(
                                  "Adicionar à Sacola",
                                  style: TextStyle(
                                      color: ThemeColors.whiteFontColor,
                                      fontSize: 16,
                                      fontWeight: pesosDeFonte['medium']),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: ThemeColors.whiteFontColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  goToThisImage(CarouselController controller, int pageIndex) {
    if (controller.ready) {
      setState(() {
        _indexPage = pageIndex;
      });
      controller.animateToPage(pageIndex);
    }
  }
}

List<Product> _productList = [
  Product(
    imageUrl: 'lib/res/assets/images/products/contra_file.jpg',
    productValue: 29.50,
    productDescription: 'Contra Filé - Kg',
    productId: 1,
    discount: 10.58,
  ),
  Product(
    imageUrl: 'lib/res/assets/images/products/peixe.jpg',
    productValue: 18.99,
    productDescription: 'Postas de Cação - 800g ',
    productId: 1,
    discount: 0.0,
  ),
];
