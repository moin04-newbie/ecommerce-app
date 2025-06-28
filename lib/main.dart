import 'package:another_apk/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:another_apk/providers/cart_provider.dart';
import 'package:another_apk/providers/products_provider.dart';
import 'package:another_apk/providers/auth_provider.dart';
import 'package:another_apk/providers/orders_provider.dart';
import 'package:another_apk/pages/product_detail_page.dart';
import 'package:another_apk/pages/cart_page.dart';
import 'package:another_apk/pages/orders_page.dart';
import 'package:another_apk/pages/auth_page.dart';
import 'package:another_apk/pages/checkout_page.dart';
import 'package:another_apk/pages/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ShopEase',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF424242),
              primary: const Color(0xFF424242),
              secondary: const Color(0xFF757575),
              tertiary: const Color(0xFFE0E0E0),
              background: Colors.white,
              surface: Colors.white,
              brightness: Brightness.light,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF424242),
              foregroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF424242),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF424242),
                side: const BorderSide(color: Color(0xFF424242)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF424242),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            cardTheme: CardTheme(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              color: Colors.white,
            ),
          ),
          home: auth.isAuth ? const HomePage() : const AuthPage(),
          routes: {
            ProductDetailPage.routeName: (ctx) => const ProductDetailPage(),
            CartPage.routeName: (ctx) => const CartPage(),
            OrdersPage.routeName: (ctx) => const OrdersPage(),
            CheckoutPage.routeName: (ctx) => const CheckoutPage(),
            ProfilePage.routeName: (ctx) => const ProfilePage(),
          },
        ),
      ),
    );
  }
}

