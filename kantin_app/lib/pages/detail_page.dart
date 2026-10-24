import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> menu;

  const DetailPage({
    super.key,
    required this.menu,
  });

  String formatRupiah(int harga) {
    return 'Rp${harga.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.fastfood,
                size: 90,
                color: Color(0xFF7654C8),
              ),
            ),
            const SizedBox(height: 24),
            CustomText(
              text: menu['nama'] as String,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            CustomText(
              text: formatRupiah(menu['harga'] as int),
              fontSize: 20,
              color: const Color(0xFF249A7B),
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
