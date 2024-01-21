import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/store_dto.dart';
import 'package:green_plate/src/presentation/features/main/application/home_service.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/page_filter.dart';
import 'package:green_plate/src/utils/toast_service.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key, required this.storeDTO});
  final StoreDTO storeDTO;
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  HomeService homeService = HomeService();

  final TextEditingController _marketSearchController = TextEditingController();
  Timer _debouncerTimer = Timer(const Duration(milliseconds: 1000), () {});
  List<StockDTO> stockDTOList = [];
  bool isLoading = false;
  PageFilter page = PageFilter(pageNumber: 0, pageSize: 20);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _marketSearchController.addListener(_onSearchChanged);
      getProdutListByStoreIdByProductName('');
    });
    super.initState();
  }

  void _onSearchChanged() {
    _debouncerTimer.cancel();
    _debouncerTimer = Timer(const Duration(milliseconds: 1500), () {
      getProdutListByStoreIdByProductName(_marketSearchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estabelecimento'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "lib/res/assets/images/store_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26.0, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    widget.storeDTO.logoImgUrl,
                    width: 30,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'lib/res/assets/images/imagem_padrao.png',
                      fit: BoxFit.cover,
                      width: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      widget.storeDTO.tradeName,
                      style: TextStyle(fontSize: 22, fontWeight: pesosDeFonte['semi-bold']),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration:
                    BoxDecoration(color: ThemeColors.textFieldBackGround, borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: _marketSearchController,
                  decoration: InputDecoration(
                    hintText: 'Busque no estabelecimento',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 20,
                        color: ThemeColors.primaryFontColor,
                      ),
                      onPressed: () => _marketSearchController.clear(),
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
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(right: 8),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: ThemeColors.textFieldBackGround,
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           child: DropdownButton(
            //               value: false,
            //               items: const [
            //                 DropdownMenuItem(
            //                   value: true,
            //                   child: Row(
            //                     children: [
            //                       Padding(
            //                         padding: EdgeInsets.symmetric(horizontal: 8),
            //                         child: Icon(Icons.motorcycle),
            //                       ),
            //                       Text('Entrega')
            //                     ],
            //                   ),
            //                 ),
            //                 DropdownMenuItem(
            //                   value: false,
            //                   child: Row(
            //                     children: [
            //                       Padding(
            //                         padding: EdgeInsets.symmetric(horizontal: 8),
            //                         child: Icon(Icons.local_mall_outlined),
            //                       ),
            //                       Text('Retirar na loja')
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //               onChanged: (value) => print("Alou")),
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            //           decoration: BoxDecoration(
            //             color: ThemeColors.textFieldBackGround,
            //             borderRadius: BorderRadius.circular(8),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Hoje',
            //                 style: TextStyle(
            //                     fontWeight: pesosDeFonte['semi-bold'], color: ThemeColors.primaryFontLowOpacityColor),
            //               ),
            //               Text(
            //                 "60 - 90min | R\$7,00",
            //                 style: TextStyle(color: ThemeColors.primaryFontLowOpacityColor),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           color: ThemeColors.primaryFontLowOpacityColor,
            //         ),
            //         padding: const EdgeInsets.all(3),
            //         child: Text(
            //           "R\$",
            //           style: TextStyle(
            //             color: ThemeColors.whiteFontColor,
            //             fontSize: 10,
            //             fontWeight: pesosDeFonte['bold'],
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8),
            //         child: Text(
            //           "Pedido mínimo R\$ 20,00",
            //           style: TextStyle(
            //             color: ThemeColors.primaryFontLowOpacityColor,
            //             fontSize: 10,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Produtos",
                    style: TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: stockDTOList.isNotEmpty
                  ? Column(
                      children: List.generate(stockDTOList.length, (index) {
                      StockDTO stockItem = stockDTOList[index];
                      return ProductStoreCard(
                        stockDTO: stockItem,
                      );
                    }))
                  : const Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        'Não foi encontrado nenhum produto',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void getProdutListByStoreIdByProductName(String queryText) {
    LoadingService.show(context);

    isLoading = true;
    page.queryText = queryText;
    homeService.findStockListByStoreIDByAnything(widget.storeDTO.id, page).then((value) {
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
}

class ProductStoreCard extends StatelessWidget {
  const ProductStoreCard({super.key, required this.stockDTO});
  final StockDTO stockDTO;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 140),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.network(
                    stockDTO.productDTO.imageUrl,
                    width: 120,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'lib/res/assets/images/imagem_padrao.png',
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          stockDTO.productDTO.name,
                          style: TextStyle(
                            fontWeight: pesosDeFonte['medium'],
                            fontSize: 16,
                            color: ThemeColors.primaryFontLowOpacityColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$ ${stockDTO.priceList[0].unitValue.toStringAsFixed(2).replaceAll('.', ',')}",
                              style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'],
                                fontSize: 20,
                                color: ThemeColors.secondary,
                              ),
                            ),
                            if (stockDTO.priceList.length > 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  "R\$ ${stockDTO.priceList[0].unitValue.toStringAsFixed(2).replaceAll('.', ',')}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: pesosDeFonte['semi-bold'],
                                      color: ThemeColors.primaryFontLowOpacityColor),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: ThemeColors.dividerColor,
            ),
          ],
        )
      ],
    );
  }
}
