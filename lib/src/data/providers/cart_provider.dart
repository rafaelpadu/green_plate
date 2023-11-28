import 'package:collection/collection.dart';
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

  bool addItem(OrderItemDTO newItem) {
    pedido ??= PedidoDTO.emptyPedido();
    OrderItemDTO? itemFound =
        pedido?.orderItemList.firstWhereOrNull((element) => element.stockDTO.id == newItem.stockDTO.id);
    if (itemFound == null) {
      if (pedido!.orderItemList.isNotEmpty && newItem.stockDTO.storeId != pedido?.orderItemList[0].stockDTO.storeId) {
        return false;
      }
      pedido!.orderItemList.add(newItem);
      updateTotalPedido();
    } else {
      newItem = itemFound;
      addQtyToOrderItem(newItem);
    }
    notifyListeners();
    return true;
  }

  void addQtyToOrderItem(OrderItemDTO item) {
    item.qtyRequested = item.qtyRequested + 1;
    item.itemTotal = (item.unitValue * item.qtyRequested);
    int index = pedido!.orderItemList.indexWhere((element) => element.stockDTO.id == item.stockDTO.id);
    pedido!.orderItemList[index] = item;
    updateTotalPedido();
    notifyListeners();
  }

  void removeQtyToOrderItem(OrderItemDTO item) {
    item.qtyRequested = item.qtyRequested - 1;
    if (item.qtyRequested == 0) {
      pedido!.orderItemList.remove(item);
    } else {
      item.itemTotal = (item.unitValue * item.qtyRequested).ceilToDouble();
      pedido!.orderItemList[pedido!.orderItemList.indexOf(item)] = item;
    }
    updateTotalPedido();
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

  updateTotalPedido() {
    pedido!.itemTotal = pedido?.orderItemList.fold(0, (sum, obj) => (sum ?? 0) + (obj.itemTotal)) ?? 0;
  }

  void clearPedido() {
    pedido = PedidoDTO.emptyPedido();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    saveCart();
  }
}
