import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:another_apk/providers/orders_provider.dart';
import 'package:another_apk/widgets/order_item_widget.dart';
import 'package:another_apk/widgets/app_drawer.dart';

class OrdersPage extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ordersData.orders.isEmpty
          ? const Center(
              child: Text('No orders yet!'),
            )
          : ListView.builder(
              itemCount: ordersData.orders.length,
              itemBuilder: (ctx, i) => OrderItemWidget(
                order: ordersData.orders[i],
              ),
            ),
    );
  }
}
