import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:another_apk/providers/cart_provider.dart';
import 'package:another_apk/widgets/cart_item_widget.dart';
import 'package:another_apk/pages/checkout_page.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: cart.totalAmount <= 0
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(CheckoutPage.routeName);
                          },
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text('CHECKOUT'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: cart.items.isEmpty
                ? const Center(child: Text('Your cart is empty!'))
                : ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      final cartItem = cart.items.values.toList()[i];
                      final productId = cart.items.keys.toList()[i];
                      return CartItemWidget(
                        id: cartItem.id,
                        productId: productId,
                        title: cartItem.title,
                        quantity: cartItem.quantity,
                        price: cartItem.price,
                        imageUrl: cartItem.imageUrl,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
