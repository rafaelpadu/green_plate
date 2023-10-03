import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/providers/cart_provider.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/presentation/features/main/application/home_service.dart';
import 'package:green_plate/src/presentation/features/products/views/product_screen.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/sale_product_card.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/page_filter.dart';
import 'package:green_plate/src/utils/toast_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  HomeService homeService = HomeService();
  Timer _debouncerTimer = Timer(const Duration(milliseconds: 1500), () {});
  List<StockDTO> stockDTOList = [];
  bool isLoading = false;
  PageFilter page = PageFilter(pageNumber: 0, pageSize: 5);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchController.addListener(_onSearchChanged);
      findStockByProductNameOrStoreName('');
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: ThemeColors.textFieldBackGround,
                ),
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Busque por produtos ou estabelecimento...',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 20,
                        color: ThemeColors.primaryFontColor,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        _debouncerTimer.cancel();
                        findStockByProductNameOrStoreName(_searchController.text);
                      },
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: CardListWidget(
                cardItems: List.generate(stockDTOList.length, (index) {
                  StockDTO stockItem = stockDTOList[index];
                  return SaleProductCard(
                    imageUrl: stockItem.productDTO.imageUrl,
                    productValue: stockItem.priceList[0].unitValue,
                    productDescription: stockItem.productDTO.description,
                    productId: stockItem.id,
                    addToCart: () => _addToCart(cartProvider, stockItem),
                    productPage: _productPage,
                    storeName: stockItem.storeTradeName,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextPage(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductListScreen()));
  }
  void _onSearchChanged() {
    _debouncerTimer.cancel();
    _debouncerTimer = Timer(const Duration(milliseconds: 1500), () {
      findStockByProductNameOrStoreName(_searchController.text);
    });
  }

  @override
  void dispose() {
    // Certifique-se de cancelar o timer ao descartar o widget
    _debouncerTimer.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void findStockByProductNameOrStoreName(String queryText) {
    LoadingService.show(context);
    isLoading = true;
    page.queryText = queryText;
    homeService.findStockListByAnything(page).then((value) {
      setState(() {
        stockDTOList = value;
        isLoading = false;
      });
      LoadingService.hide();
    }).catchError((err) {
      LoadingService.hide();
      isLoading = false;
      ToastService.error(err is GreenPlateException ? err.message : err.toString());
    });
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

  void _addToCart(CartProvider cartProvider, StockDTO stockDTO) {
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
    }
  }
}
