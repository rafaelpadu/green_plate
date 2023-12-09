import 'package:flutter/material.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/domain/model/DTOs/store_dto.dart';
import 'package:green_plate/src/presentation/features/main/application/store_service.dart';
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
        child: FutureBuilder<List<StoreDTO>>(
          future: findStoreList(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<StoreDTO> storeList = snapshot.data!;
              return CardListWidget(
                cardItems: List.generate(storeList.length, (index) {
                  StoreDTO store = storeList[index];
                  return StoreCardImage(
                    imageUrl: store.logoImgUrl,
                    rating: store.rating,
                    storeType: store.storeType,
                    storeName: store.tradeName,
                    goToStorePage: () => goToPagesStore(context, store),
                  );
                }),
              );
            }
            if (snapshot.hasError) {
              var error = snapshot.error;
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
          },
        ),
      ),
    );
  }

  void goToPagesStore(BuildContext context, StoreDTO store) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen(storeDTO: store)));
  }

  Future<List<StoreDTO>> findStoreList() async {
    StoreService storeService = StoreService();

    return await storeService.findAllStore();
  }
}
