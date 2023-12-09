import 'package:green_plate/src/data/repositories/store_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/store_dto.dart';

class StoreService {
  final StoreRepository _storeRepository = StoreRepository();

  Future<List<StoreDTO>> findAllStore() {
    return _storeRepository.findAllStore();
  }
}
