// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/providers/cart_provider.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/domain/model/product.dart';
import 'package:green_plate/src/presentation/features/products/application/stock_service.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/carousel_image.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/product_with_price_card.dart';
import 'package:green_plate/src/utils/case_formatters.dart';
import 'package:green_plate/src/utils/toast_service.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final StockDTO stockDTO;
  const ProductScreen({Key? key, required this.stockDTO}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _indexPage = 0;
  List<String> images = [];
  List<StockDTO> similarItems = [];
  final CarouselController controller = CarouselController();
  @override
  void initState() {
    super.initState();
    images.add(widget.stockDTO.productDTO.imageUrl);
    WidgetsBinding.instance.addPostFrameCallback((_) => findProductByCategory());
  }

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
                          onTap: () => switchImageCarousel(controller, pageIndex),
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
                    widget.stockDTO.productDTO.name,
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
                    // Text(
                    //   "${widget.weight?.ceil()} g",
                    //   style: TextStyle(fontWeight: pesosDeFonte['bold'], fontSize: 29),
                    // ),
                    Text(
                      CaseFormatters().currencyBRLFormatter(widget.stockDTO.priceList[0].unitValue),
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
                        widget.stockDTO.productDTO.productCategory.translate,
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
                        widget.stockDTO.productDTO.description,
                        style: TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.storefront_outlined,
                      size: 32,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.stockDTO.storeTradeName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
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
              ...Iterable<int>.generate(similarItems.length).map(
                (index) {
                  StockDTO stockItem = similarItems[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => _goToProductPage(stockItem),
                        child: ProductPriceCard(
                          imageAsset: stockItem.productDTO.imageUrl,
                          productName: stockItem.productDTO.name,
                          price: stockItem.priceList[0].unitValue,
                          discount: stockItem.priceList.length > 1 ? stockItem.priceList[1].unitValue : 0,
                        ),
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
                          onTap: () => _addToCart(widget.stockDTO),
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

  switchImageCarousel(CarouselController controller, int pageIndex) {
    if (controller.ready) {
      setState(() {
        _indexPage = pageIndex;
      });
      controller.animateToPage(pageIndex);
    }
  }

  void findProductByCategory() {
    StockService stockService = StockService();
    stockService.findAvailableStockItemsByProductCategory(widget.stockDTO.productDTO.productCategory).then((value) {
      setState(() {
        similarItems = value;
      });
    }).catchError((err) {
      ToastService.error(err is GreenPlateException ? err.message : err.toString());
    });
  }

  void _goToProductPage(StockDTO stockItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(stockDTO: stockItem),
      ),
    );
  }

  void _addToCart(StockDTO stockDTO) {
    CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
    OrderItemDTO newOrderItem = OrderItemDTO(
      createdAt: DateTime.now(),
      stockDTO: stockDTO,
      itemTotal: stockDTO.priceList[0].unitValue,
      unitValue: stockDTO.priceList[0].unitValue,
      discount: 0,
      qtyRequested: 1,
    );
    bool resp = cartProvider.addItem(newOrderItem);
    if (!resp) {
      ToastService.warning("Os items de um mesmo pedido devem ser todos do mesmo estabelecimento");
    } else {
      ToastService.success("Produto adicionado na sacola com sucesso!");
      Future.delayed(const Duration(milliseconds: 1500)).then((value) => Navigator.pop(context));
    }
  }
}
