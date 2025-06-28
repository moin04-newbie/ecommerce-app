import 'package:flutter/foundation.dart';
import 'package:another_apk/models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    // Clothing Category
    Product(
      id: 'p1',
      title: 'Shirt',
      description: 'A comfortable red shirt made of 100% cotton. Perfect for casual outings and everyday wear.',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/736x/47/af/37/47af37136a95fab822cff14bd00badab.jpg',
      category: 'Clothing',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A pair of comfortable trousers with stretch fabric. Great for office or casual wear.',
      price: 59.99,
      imageUrl: 'https://i.pinimg.com/736x/f1/5f/34/f15f34966cdc5ddd306a0f47e5399602.jpg',
      category: 'Clothing',
    ),
    Product(
      id: 'p3',
      title: 'T-Shirt',
      description: 'Stylish and modern T-Shirt with a sleek design. Perfect for any occasion.',
      price: 199.99,
      imageUrl: 'https://i.pinimg.com/736x/f1/5f/34/f15f34966cdc5ddd306a0f47e5399602.jpg',
      category: 'Clothing',
    ),
    Product(
      id: 'p4',
      title: 'Denim Jacket',
      description: 'Classic denim jacket that never goes out of style. Features multiple pockets and comfortable fit.',
      price: 89.99,
      imageUrl: 'https://i.pinimg.com/736x/a2/c3/79/a2c37911130b987c79b512876699b9eb.jpg',
      category: 'Clothing',
    ),
    Product(
      id: 'p5',
      title: 'Summer Dress',
      description: 'Light and flowy summer dress with floral pattern. Perfect for warm days and outdoor events.',
      price: 45.99,
      imageUrl: 'https://i.pinimg.com/736x/4f/f9/67/4ff967a83e89011d3bbca75c242aed38.jpg',
      category: 'Clothing',
    ),
    
    // Electronics Category
    Product(
      id: 'p6',
      title: 'Headphones',
      description: 'Latest headphones with high-resolution audio, noise cancellation, and all-day battery life.',
      price: 199.99,
      imageUrl: 'https://i.pinimg.com/736x/cd/0c/e7/cd0ce7588463201339c7af047cf5aa22.jpg',
      category: 'Electronics',
    ),
    Product(
      id: 'p7',
      title: 'Laptop',
      description: 'High-performance laptop for work and entertainment. Features a fast processor and crystal-clear display.',
      price: 899.99,
      imageUrl: 'https://i.pinimg.com/736x/c8/5f/e7/c85fe7d2665d95befa83c1ac112c2417.jpg',
      category: 'Electronics',
    ),
    Product(
      id: 'p8',
      title: 'Mobile Phone',
      description: 'Latest smartphone with high-resolution camera, fast processor, and all-day battery life.',
      price: 699.99,
      imageUrl: 'https://i.pinimg.com/736x/41/c9/b4/41c9b479009e4379cc67178263f80393.jpg',
      category: 'Electronics',
    ),
    Product(
      id: 'p9',
      title: 'Smartwatch',
      description: 'Track your fitness goals and stay connected with this sleek smartwatch. Water-resistant and long battery life.',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1579586337278-3befd40fd17a',
      category: 'Electronics',
    ),
    
    // Home & Kitchen Category
    Product(
      id: 'p10',
      title: 'Cast Iron Pan',
      description: 'Durable cast iron pan that distributes heat evenly. Perfect for cooking a variety of dishes.',
      price: 49.99,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
      category: 'Home & Kitchen',
    ),
    Product(
      id: 'p11',
      title: 'Coffee Maker',
      description: 'Programmable coffee maker that brews the perfect cup every time. Easy to use and clean.',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1570087385429-a7b5f0d10a13',
      category: 'Home & Kitchen',
    ),
    Product(
      id: 'p12',
      title: 'Blender',
      description: 'Powerful blender for smoothies, soups, and more. Multiple speed settings and easy to clean.',
      price: 69.99,
      imageUrl: 'https://images.unsplash.com/photo-1570222094114-d054a817e56b',
      category: 'Home & Kitchen',
    ),
    
    // Accessories Category
    Product(
      id: 'p13',
      title: 'Leather Wallet',
      description: 'Genuine leather wallet with multiple card slots and sleek design. Perfect everyday accessory.',
      price: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1627123424574-724758594e93',
      category: 'Accessories',
    ),
    Product(
      id: 'p14',
      title: 'Sunglasses',
      description: 'Stylish sunglasses with UV protection. Lightweight frame and comfortable fit.',
      price: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
      category: 'Accessories',
    ),
    
    // Footwear Category
    Product(
      id: 'p15',
      title: 'Running Shoes',
      description: 'Comfortable running shoes with cushioned soles and breathable material. Perfect for exercise or casual wear.',
      price: 89.99,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      category: 'Footwear',
    ),
    Product(
      id: 'p16',
      title: 'Leather Boots',
      description: 'Durable leather boots with non-slip sole. Water-resistant and comfortable for all-day wear.',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1608256246200-72e042a0893d',
      category: 'Footwear',
    ),
    
    // Beauty & Personal Care
    Product(
      id: 'p17',
      title: 'Skincare Set',
      description: 'Complete skincare set with cleanser, toner, and moisturizer. Made with natural ingredients.',
      price: 49.99,
      imageUrl: 'https://images.unsplash.com/photo-1556229010-6c3f2c9ca5f8',
      category: 'Beauty & Personal Care',
    ),
    Product(
      id: 'p18',
      title: 'Perfume',
      description: 'Elegant fragrance with notes of jasmine and vanilla. Long-lasting and comes in a stylish bottle.',
      price: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1592945403244-b3fbafd7f539',
      category: 'Beauty & Personal Care',
    ),
    
    // Books & Stationery
    Product(
      id: 'p19',
      title: 'Notebook Set',
      description: 'Set of 3 premium notebooks with high-quality paper. Perfect for journaling, notes, and sketches.',
      price: 24.99,
      imageUrl: 'https://images.unsplash.com/photo-1531346878377-a5be20888e57',
      category: 'Books & Stationery',
    ),
    Product(
      id: 'p20',
      title: 'Bestseller Novel',
      description: 'Award-winning novel that has captivated readers worldwide. A compelling story of adventure and discovery.',
      price: 19.99,
      imageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f',
      category: 'Books & Stationery',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  List<String> get categories {
    // Get unique categories and sort them
    final categories = <String>{};
    for (var product in _items) {
      categories.add(product.category);
    }
    final categoryList = categories.toList()..sort();
    return categoryList;
  }

  List<Product> getProductsByCategory(String category) {
    // Explicitly compare each product's category with the selected category
    return _items.where((product) => product.category == category).toList();
  }

  // Create a method to directly get products by a specific filter
  List<Product> getFilteredProducts({bool onlyFavorites = false, String? category, String? searchQuery}) {
    List<Product> filteredProducts = onlyFavorites ? favoriteItems : [..._items];
    
    if (category != null && category.isNotEmpty) {
      filteredProducts = filteredProducts.where((product) => product.category == category).toList();
    }
    
    if (searchQuery != null && searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts.where((product) => 
        product.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
        product.description.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
    
    return filteredProducts;
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
  
  void toggleFavorite(String id) {
    final productIndex = _items.indexWhere((product) => product.id == id);
    if (productIndex >= 0) {
      _items[productIndex].toggleFavorite();
      notifyListeners();
    }
  }
}
