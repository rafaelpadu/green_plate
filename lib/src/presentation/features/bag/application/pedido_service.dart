import 'package:green_plate/src/data/repositories/pedido_repository.dart';
import 'package:green_plate/src/domain/model/DTOs/pedido_dto.dart';

class PedidoService {
  PedidoRepository pedidoRepository = PedidoRepository();
  Future<void> createNewPedido(PedidoDTO pedido, int userId) {
    pedido.storeId = pedido.orderItemList[0].stockDTO.storeId;
    return pedidoRepository.createNewPedido(pedido, userId);
  }
}
