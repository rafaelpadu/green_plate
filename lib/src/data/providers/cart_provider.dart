import 'package:flutter/foundation.dart';
import 'package:green_plate/src/domain/model/DTOs/order_item_dto.dart';
import 'package:green_plate/src/domain/model/DTOs/pedido_dto.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier {
  PedidoDTO? pedido;

  CartProvider({pedido});

  PedidoDTO getPedido() {
    pedido ??= PedidoDTO.emptyPedido();
    return pedido!;
  }

  void addItem(OrderItemDTO item) {
    pedido ??= PedidoDTO.emptyPedido();
    pedido!.orderItemList.add(item);
    pedido!.itemTotal += item.itemTotal;
    notifyListeners();
  }

  Future<void> saveCart() async {
    if (pedido != null) {
      final box = await Hive.openBox('cart');
      await box.put('cart', pedido!.toJson());
    }
  }

  Future<void> loadCart() async {
    final box = await Hive.openBox('cart');
    if (box.containsKey('cart')) {
      pedido = PedidoDTO.fromJson(box.get('cart'));
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    saveCart();
  }
}
