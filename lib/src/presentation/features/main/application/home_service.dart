import 'package:green_plate/src/data/repositories/stock_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/stock_dto.dart';
import 'package:green_plate/src/utils/page_filter.dart';

class HomeService {
  StockRepository stockRepository = StockRepository();
  Future<List<StockDTO>> findStockListByAnything(PageFilter page) async {
    return stockRepository.findStockByProductNameOrStoreTradeName(page);
  }
}
