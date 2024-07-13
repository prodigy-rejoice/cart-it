import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDropDownButton extends StatelessWidget {
  const ProductDropDownButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: const Color(0xff343434)),
        ),
        const Icon(Icons.keyboard_arrow_down_outlined)
      ],
    );
  }
}
