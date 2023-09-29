import 'package:flutter/material.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/providers/cart_provider.dart';
import 'package:green_plate/src/domain/enum/product_category.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/presentation/features/products/application/stock_service.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/sale_product_card.dart';
import 'package:green_plate/src/utils/toast_service.dart';
import 'package:provider/provider.dart';

import 'product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.productCategory});
  final ProductCategory productCategory;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productCategory.translate),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<StockDTO>>(
            future: getStockItemsAvailable(),
            builder: (context, snapShot) {
              if (snapShot.hasData && snapShot.data != null) {
                List<StockDTO> stockItemsDTO = snapShot.data!;
                return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: CardListWidget(
                      cardItems: List.generate(stockItemsDTO.length, (index) {
                        StockDTO stockItem = stockItemsDTO[index];
                        return SaleProductCard(
                          imageUrl: stockItem.productDTO.imageUrl,
                          productValue: stockItem.priceList[0].unitValue,
                          productDescription: stockItem.productDTO.description,
                          productId: stockItem.id,
                          addToCart: () => _addToCart(cartProvider, stockItem),
                          productPage: _productPage,
                        );
                      }),
                    )
                    // List.generate((saleProductList.length / 2).ceil(), (index) => saleProductList[index]),
                    );
              }
              if (snapShot.hasError) {
                var error = snapShot.error;
                return Center(
                  child: Column(children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        (error is GreenPlateException) ? error.message : "Erro de conexão. Tente novamente mais tarde",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  void _addToCart(CartProvider cartProvider, StockDTO stockDTO) {
    OrderItemDTO newOrderItem = OrderItemDTO(
      createdAt: DateTime.now(),
      stockId: stockDTO.id,
      itemTotal: stockDTO.priceList[0].unitValue,
      unitValue: stockDTO.priceList[0].unitValue,
      discount: 0,
      qtyRequested: 1,
    );
    cartProvider.addItem(newOrderItem);
    ToastService.success('Produto adiciona na sacola com sucesso!');
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

  Future<List<StockDTO>> getStockItemsAvailable() {
    StockService stockService = StockService();
    return stockService.findAvailableStockItemsByProductCategory(widget.productCategory);
  }
}
