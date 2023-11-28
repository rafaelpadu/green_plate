import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/data/providers/cart_provider.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/pedido_dto.dart';
import 'package:green_plate/src/presentation/features/bag/application/pedido_service.dart';
import 'package:green_plate/src/presentation/features/bag/views/bag_product_card.dart';
import 'package:green_plate/src/utils/case_formatters.dart';
import 'package:green_plate/src/utils/green_plate_dialog.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/toast_service.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  late PedidoDTO pedido;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    pedido = cartProvider.getPedido();
    return SingleChildScrollView(
      child: (pedido.orderItemList.isEmpty)
          ? Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Text(
                  'Sua sacola está vazia',
                  style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['medium']),
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Produtos",
                    style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
                  ),
                ),
                ...List.generate(pedido.orderItemList.length, (index) {
                  OrderItemDTO orderItem = pedido.orderItemList[index];
                  return Column(
                    children: [
                      BagProductCard(
                        orderItem: orderItem,
                        plusQty: () => addQtyProduct(orderItem),
                        minusQty: () => rmQtyProduct(orderItem),
                      ),
                      Divider(
                        color: ThemeColors.dividerColor,
                        thickness: 1.4,
                      )
                    ],
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Material(
                          color: ThemeColors.greenBackGroundColor,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Adicionar Mais Produtos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ThemeColors.primary, fontSize: 16, fontWeight: pesosDeFonte['medium']),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // const DeleveryLocation(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Subtotal',
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //     Text(
                            //       CaseFormatters().currencyBRLFormatter(pedido.itemTotal),
                            //       style: const TextStyle(fontSize: 15),
                            //     ),
                            //   ],
                            // ),
                            // const Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Taxa de Entrega',
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //     Text(
                            //       'R\$75,00',
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(fontSize: 15, fontWeight: pesosDeFonte['medium']),
                                ),
                                Text(
                                  CaseFormatters().currencyBRLFormatter(pedido.itemTotal),
                                  style: TextStyle(fontSize: 15, fontWeight: pesosDeFonte['medium']),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Método de Pagamento",
                              style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ThemeColors.greenBackGroundColor,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ThemeColors.primary,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "R\$",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: pesosDeFonte['bold'],
                                          color: ThemeColors.whiteFontColor,
                                        ),
                                      ),
                                    ),
                                    const Text("Dinheiro"),
                                    const Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Material(
                          color: ThemeColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onTap: () => confirmPedido(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(),
                                  Text(
                                    'Confirmar Pedido',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: pesosDeFonte['medium'],
                                      color: ThemeColors.whiteFontColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: ThemeColors.whiteFontColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }

  addQtyProduct(OrderItemDTO orderItem) {
    Provider.of<CartProvider>(context, listen: false).addQtyToOrderItem(orderItem);
    setState(() {
      // widget.orderItem.itemTotal = orderItemDTO.itemTotal;
      // qtyRequested = orderItemDTO.qtyRequested;
    });
  }

  rmQtyProduct(OrderItemDTO orderItem) {
    Provider.of<CartProvider>(context, listen: false).removeQtyToOrderItem(orderItem);

    setState(() {
      // widget.orderItem.itemTotal = orderItemDTO.itemTotal;
      // qtyRequested = orderItemDTO.qtyRequested;
    });
  }

  confirmPedido() async {
    const storage = FlutterSecureStorage();

    storage.read(key: 'userId').then((userId) {
      if (userId == null) {
        ToastService.warning('Você precisa estar logado para poder criar um pedido');
        return null;
      }
      int? userIdInt = int.tryParse(userId);
      if (userIdInt == null) {
        ToastService.error('Erro ao tentar criar um novo pedido');
        return null;
      }
      if (pedido.orderItemList.isNotEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const GreenPlateDialog(
                titlePartOne: "Deseja",
                titlePartThree: "o pedido?",
                titlePartTwo: " Confirmar ",
                type: AlertType.confirmation,
              );
            }).then((value) {
          if (value) {
            LoadingService.show(context);
            PedidoService pedidoService = PedidoService();
            pedidoService.createNewPedido(pedido, userIdInt).then((value) {
              LoadingService.hide();
              ToastService.success('Pedido criado com sucesso!');
              Provider.of<CartProvider>(context, listen: false).clearPedido();
            }).catchError((err) {
              LoadingService.hide();
              ToastService.error(err is GreenPlateException ? err.message : 'Erro ao tentar criar um novo pedido');
              return null;
            });
          }
        }).catchError((err) {
          ToastService.error(err is GreenPlateException ? err.message : 'Erro ao tentar criar um novo pedido');
          return null;
        });
      }
    }).catchError((err) {
      ToastService.error(err is GreenPlateException ? err.message : 'Erro ao tentar criar um novo pedido');
    });
  }
}
