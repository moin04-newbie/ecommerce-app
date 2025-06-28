import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:another_apk/providers/products_provider.dart';
import 'package:another_apk/widgets/product_grid.dart';
import 'package:another_apk/widgets/app_drawer.dart';
import 'package:another_apk/widgets/badge.dart';
import 'package:another_apk/providers/cart_provider.dart';
import 'package:another_apk/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedCategory;
  final TextEditingController _searchController = TextEditingController();
  bool _onlyFavorites = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final categories = productsData.categories;
    
    // Debug print categories
    debugPrint('Available categories: $categories');
    debugPrint('Selected category: $_selectedCategory');

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'ShopEase',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(_onlyFavorites ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _onlyFavorites = !_onlyFavorites;
              });
            },
          ),
          Consumer<CartProvider>(
            builder: (_, cart, child) => BadgeWidget(
              value: cart.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartPage.routeName);
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: const Text('All'),
                          selected: _selectedCategory == null,
                          showCheckmark: false,
                          backgroundColor: Colors.grey.shade100,
                          selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          labelStyle: TextStyle(
                            color: _selectedCategory == null
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade800,
                            fontWeight: _selectedCategory == null
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = null;
                            });
                          },
                        ),
                      ),
                      ...categories.map((category) {
                        final isSelected = _selectedCategory == category;
                        // Debug print each category chip
                        debugPrint('Category chip: $category, selected: $isSelected');
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Text(category),
                            selected: isSelected,
                            showCheckmark: false,
                            backgroundColor: Colors.grey.shade100,
                            selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey.shade800,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            onSelected: (selected) {
                              setState(() {
                                // Store the exact category string from our list
                                _selectedCategory = selected ? category : null;
                                debugPrint('Category selected: $_selectedCategory');
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ProductGrid(
              onlyFavorites: _onlyFavorites,
              category: _selectedCategory,
              searchQuery: _searchController.text,
            ),
          ),
        ],
      ),
    );
  }
}
