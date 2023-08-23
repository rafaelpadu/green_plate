import 'package:flutter/material.dart';
import 'package:green_plate/src/domain/model/store.dart';
import 'package:green_plate/src/presentation/features/store/views/store_screen.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/card_list.dart';
import 'package:green_plate/src/presentation/widgets/data_driven/store_card_image.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: CardListWidget(
          cardItems: List.generate(stores.length, (index) {
            Store store = stores[index];
            return StoreCardImage(
              imageUrl: stores[index].imageUrl,
              rating: store.rating,
              storeType: store.storeType,
              storeName: store.storeName,
              description: store.description,
              distance: store.distance,
              goToStorePage: () => goToPagesStore(context),
            );
          }),
        ),
      ),
    );
  }

  void goToPagesStore(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreScreen()));
  }
}

List<Store> stores = [
  Store(
      imageUrl: 'lib/res/assets/images/logos/comper.png',
      rating: 4.5,
      storeType: 'Mercado',
      storeName: 'Comper - Itanhangá',
      description: '60-90min | R\$7,00',
      distance: 5.56),
  Store(
    imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
    rating: 4.7,
    storeType: 'Padaria',
    storeName: 'Pão & Tal',
    description: '25-45min | R\$9,00',
    distance: 4.56,
  ),
  Store(
    imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
    rating: 4.7,
    storeType: 'Padaria',
    storeName: 'Pão & Tal',
    description: '25-45min | R\$9,00',
    distance: 4.56,
  ),
  Store(
    imageUrl: 'lib/res/assets/images/logos/comper.png',
    rating: 4.5,
    storeType: 'Mercado',
    storeName: 'Comper - Itanhangá',
    description: '60-90min | R\$7,00',
    distance: 5.56,
  ),
  Store(
    imageUrl: 'lib/res/assets/images/logos/comper.png',
    rating: 4.5,
    storeType: 'Mercado',
    storeName: 'Comper - Itanhangá',
    description: '60-90min | R\$7,00',
    distance: 5.56,
  ),
  Store(
    imageUrl: 'lib/res/assets/images/logos/pao_e_tal.png',
    rating: 4.7,
    storeType: 'Padaria',
    storeName: 'Pão & Tal',
    description: '25-45min | R\$9,00',
    distance: 4.56,
  ),
];
