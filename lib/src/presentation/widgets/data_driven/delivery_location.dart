import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class DeleveryLocation extends StatelessWidget {
  const DeleveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Local de Entrega',
              style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium']),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Alterar",
                style: TextStyle(fontSize: 16, fontWeight: pesosDeFonte['medium'], color: ThemeColors.primary),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 108, 217, 12.1),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: ThemeColors.blueIconColor,
                    )),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.place_outlined,
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rua Dr. Adeir Ávila de Andrade, Nº 3250',
                  ),
                  Text('Apartamento 101'),
                  Text("Vila Mágica, Campo Grande - MS")
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
