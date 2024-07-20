import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDropDownButton extends StatefulWidget {
  const ProductDropDownButton({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final String content;

  @override
  State<ProductDropDownButton> createState() => _ProductDropDownButtonState();
}

class _ProductDropDownButtonState extends State<ProductDropDownButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xff343434)),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon((isExpanded
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined)))
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isExpanded ? 100 : 0,
          child: SingleChildScrollView(
            child: Text(
              widget.content,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff818181)),
            ),
          ),
        ),
      ],
    );
  }
}
