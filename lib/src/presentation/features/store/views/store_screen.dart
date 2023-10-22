import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final TextEditingController _marketSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supermercado'),
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
                  Image.asset(
                    'lib/res/assets/images/logos/comper.png',
                    width: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Supermercado Comper",
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.textFieldBackGround,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton(
                          value: false,
                          items: const [
                            DropdownMenuItem(
                              value: true,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Icon(Icons.motorcycle),
                                  ),
                                  Text('Entrega')
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Icon(Icons.local_mall_outlined),
                                  ),
                                  Text('Retirar na loja')
                                ],
                              ),
                            ),
                          ],
                          onChanged: (value) => print("Alou")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                        color: ThemeColors.textFieldBackGround,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hoje',
                            style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'], color: ThemeColors.primaryFontLowOpacityColor),
                          ),
                          Text(
                            "60 - 90min | R\$7,00",
                            style: TextStyle(color: ThemeColors.primaryFontLowOpacityColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ThemeColors.primaryFontLowOpacityColor,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      "R\$",
                      style: TextStyle(
                        color: ThemeColors.whiteFontColor,
                        fontSize: 10,
                        fontWeight: pesosDeFonte['bold'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Pedido mínimo R\$ 20,00",
                      style: TextStyle(
                        color: ThemeColors.primaryFontLowOpacityColor,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Destaques",
                    style: TextStyle(fontWeight: pesosDeFonte['medium'], fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 140),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset('lib/res/assets/images/products/leite_po_dano.png'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Arla DANO Full Cream Milk Powder Instant',
                          style: TextStyle(
                            fontWeight: pesosDeFonte['medium'],
                            fontSize: 16,
                            color: ThemeColors.primaryFontLowOpacityColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$1.000,00",
                              style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'],
                                fontSize: 20,
                                color: ThemeColors.secondary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'R\$ 1.500,00',
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
            Container(
              constraints: const BoxConstraints(maxHeight: 140),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset('lib/res/assets/images/products/leite_po_nido.png'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Arla DANO Full Cream Milk Powder Instant',
                          style: TextStyle(
                            fontWeight: pesosDeFonte['medium'],
                            fontSize: 16,
                            color: ThemeColors.primaryFontLowOpacityColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$1.000,00",
                              style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'],
                                fontSize: 20,
                                color: ThemeColors.secondary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'R\$ 1.500,00',
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
            Padding(
              padding: const EdgeInsets.only(left: 16),
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
              constraints: const BoxConstraints(maxHeight: 140),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset('lib/res/assets/images/products/leite_po_dano.png'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Arla DANO Full Cream Milk Powder Instant',
                          style: TextStyle(
                            fontWeight: pesosDeFonte['medium'],
                            fontSize: 16,
                            color: ThemeColors.primaryFontLowOpacityColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$1.000,00",
                              style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'],
                                fontSize: 20,
                                color: ThemeColors.secondary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'R\$ 1.500,00',
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
            Container(
              constraints: const BoxConstraints(maxHeight: 140),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset('lib/res/assets/images/products/leite_po_nido.png'),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Arla DANO Full Cream Milk Powder Instant',
                          style: TextStyle(
                            fontWeight: pesosDeFonte['medium'],
                            fontSize: 16,
                            color: ThemeColors.primaryFontLowOpacityColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "R\$1.000,00",
                              style: TextStyle(
                                fontWeight: pesosDeFonte['semi-bold'],
                                fontSize: 20,
                                color: ThemeColors.secondary,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'R\$ 1.500,00',
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
        ),
      ),
    );
  }
}
