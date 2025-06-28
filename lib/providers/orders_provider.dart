import 'package:flutter/foundation.dart';
import 'package:another_apk/models/order.dart';
import 'package:another_apk/models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }
  
  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
  
  void updateOrderStatus(String orderId, String status) {
    final orderIndex = _orders.indexWhere((order) => order.id == orderId);
    if (orderIndex >= 0) {
      _orders[orderIndex] = Order(
        id: _orders[orderIndex].id,
        amount: _orders[orderIndex].amount,
        products: _orders[orderIndex].products,
        dateTime: _orders[orderIndex].dateTime,
        status: status,
      );
      notifyListeners();
    }
  }
}
