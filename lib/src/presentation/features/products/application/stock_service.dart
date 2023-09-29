import 'package:green_plate/src/data/repositories/stock_repository.dart';
import 'package:green_plate/src/domain/enum/product_category.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';

class StockService {
  StockRepository stockRepository = StockRepository();

  Future<List<StockDTO>> findAvailableStockItems() {
    return stockRepository.findAvailableStockItems();
  }

  Future<List<StockDTO>> findAvailableStockItemsByProductCategory(ProductCategory productCategory) {
    return stockRepository.findAvailableStockItemsByProductCategory(productCategory);
  }
}
