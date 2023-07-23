import 'package:flutter/material.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/store_card_image.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<StoreCardImage> categories = [
      const StoreCardImage(
          imageUrl: 'lib/res/assets/images/logos/comper.png',
          rating: 4.5,
          storeType: 'Mercado',
          storeName: 'Comper - Itanhangá',
          description: '60-90min | R\$7,00',
          distance: 5.56),
      const StoreCardImage(
        imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
        rating: 4.7,
        storeType: 'Padaria',
        storeName: 'Pão & Tal',
        description: '25-45min | R\$9,00',
        distance: 4.56,
      ),
      const StoreCardImage(
        imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
        rating: 4.7,
        storeType: 'Padaria',
        storeName: 'Pão & Tal',
        description: '25-45min | R\$9,00',
        distance: 4.56,
      ),
      const StoreCardImage(
          imageUrl: 'lib/res/assets/images/logos/comper.png',
          rating: 4.5,
          storeType: 'Mercado',
          storeName: 'Comper - Itanhangá',
          description: '60-90min | R\$7,00',
          distance: 5.56),
      const StoreCardImage(
          imageUrl: 'lib/res/assets/images/logos/comper.png',
          rating: 4.5,
          storeType: 'Mercado',
          storeName: 'Comper - Itanhangá',
          description: '60-90min | R\$7,00',
          distance: 5.56),
      const StoreCardImage(
        imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
        rating: 4.7,
        storeType: 'Padaria',
        storeName: 'Pão & Tal',
        description: '25-45min | R\$9,00',
        distance: 4.56,
      ),
    ];
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: CardListWidget(
          cardItems: categories,
          onPressed: (item) => print(item),
        ),
      ),
    );
  }
}
