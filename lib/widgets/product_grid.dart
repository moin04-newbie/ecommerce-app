import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:another_apk/providers/products_provider.dart';
import 'package:another_apk/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool onlyFavorites;
  final String? category;
  final String searchQuery;

  const ProductGrid({
    Key? key,
    this.onlyFavorites = false,
    this.category,
    this.searchQuery = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);

    final products = productsData.getFilteredProducts(
      onlyFavorites: onlyFavorites,
      category: category,
      searchQuery: searchQuery.isNotEmpty ? searchQuery : null,
    );

    return products.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, size: 50, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  category != null
                      ? 'No products found in "$category" category'
                      : 'No products found',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: const ProductItem(),
            ),
          );
  }
}
