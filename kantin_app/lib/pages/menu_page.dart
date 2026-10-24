import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import 'detail_page.dart';
import 'add_menu_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Map<String, dynamic>> daftarMenu = [
    {
      'nama': 'Nasi Goreng Spesial',
      'harga': 15000,
    },
    {
      'nama': 'Mie Ayam',
      'harga': 12000,
    },
    {
      'nama': 'Ayam Geprek',
      'harga': 18000,
    },
    {
      'nama': 'Roti Bakar Cokelat',
      'harga': 10000,
    },
    {
      'nama': 'Es Teh Manis',
      'harga': 5000,
    },
  ];

  String formatRupiah(int harga) {
    return 'Rp${harga.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    )}';
  }

  Future<void> bukaTambahMenu() async {
    final hasil = await Get.to<Map<String, dynamic>>(
      () => const AddMenuPage(),
    );

    if (hasil != null) {
      setState(() {
        daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Kantin Kita',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const CustomText(
              text: 'Menu Hari Ini',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant,
                      color: Color(0xFF7654C8),
                    ),
                    title: CustomText(
                      text: menu['nama'] as String,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: CustomText(
                      text: formatRupiah(menu['harga'] as int),
                      fontSize: 14,
                      color: const Color(0xFF249A7B),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF7654C8),
                    ),
                    onTap: () {
                      Get.to(
                        () => DetailPage(menu: menu),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bukaTambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
