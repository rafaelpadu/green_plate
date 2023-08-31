import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/bag/views/bag_product_card.dart';
import 'package:green_plate/src/presentation/features/products/views/product_list_screen.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/delivery_location.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "Produtos",
              style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
            ),
          ),
          ...List.generate(
            saleProductList.length,
            (index) => Column(
              children: [
                BagProductCard(product: saleProductList[index]),
                Divider(
                  color: ThemeColors.dividerColor,
                  thickness: 1.4,
                )
              ],
            ),
          ),
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
                          style:
                              TextStyle(color: ThemeColors.primary, fontSize: 16, fontWeight: pesosDeFonte['medium']),
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
                const DeleveryLocation(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'R\$1.000,00',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxa de Entrega',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'R\$75,00',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 15, fontWeight: pesosDeFonte['medium']),
                          ),
                          Text(
                            'R\$1.000,00',
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
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(
                              'Faça o Pedido',
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
}
