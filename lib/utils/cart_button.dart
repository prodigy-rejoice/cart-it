import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButtonWithCount extends StatelessWidget {
  final int count;
  final Function() onTap;
  const CartButtonWithCount(
      {Key? key, required this.count, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          right: 8,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: onTap,
            icon: const Icon(
              Icons.shopping_cart,
              color: Color(0xff408C2B),
            ),
          ),
        ),
        Positioned(
          top: 67,
          right: 29,
          child: Text(
            '$count',
            style: GoogleFonts.inter(
                fontSize: 8,
                color: const Color(0XFFFFFFFF),
                fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
