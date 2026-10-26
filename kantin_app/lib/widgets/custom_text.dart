import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Quicksand dipilih karena memiliki bentuk huruf membulat 
// yang memberikan kesan ramah, unik, dan modern.
// Ukuran, warna, dan ketebalan teks dapat disesuaikan melalui parameter.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = const Color(0xFF263238),
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}