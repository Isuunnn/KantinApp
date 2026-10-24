import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const KantinApp());
}

class KantinApp extends StatelessWidget {
  const KantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Kita',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFBF5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7654C8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7654C8),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF48C9A5),
          foregroundColor: Color(0xFF183B32),
        ),
      ),
      home: const MenuPage(),
    );
  }
}