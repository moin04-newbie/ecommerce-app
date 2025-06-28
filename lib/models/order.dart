import 'package:another_apk/models/cart_item.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  final String status;

  Order({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    this.status = 'pending',
  });
}
