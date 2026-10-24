import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController hargaController =
      TextEditingController();

  void simpanMenu() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Get.back(
      result: <String, dynamic>{
        'nama': namaController.text.trim(),
        'harga': int.parse(hargaController.text),
      },
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Tambah Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama makanan atau minuman',
                  hintText: 'Contoh: Soto Ayam',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Harga menu',
                  hintText: 'Contoh: 15000',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga wajib diisi';
                  }

                  final harga = int.tryParse(value);

                  if (harga == null) {
                    return 'Harga harus berupa angka';
                  }

                  if (harga <= 0) {
                    return 'Harga harus lebih dari nol';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: simpanMenu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7654C8),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    48,
                  ),
                ),
                child: const CustomText(
                  text: 'Simpan Menu',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
