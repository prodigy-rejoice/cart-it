import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/add_to_cart.dart';

class AddProductToCart extends StatelessWidget {
  const AddProductToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Color(0xff408C2B),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        title: Text(
          'Sub',
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xffFAFAFA)),
        ),
        subtitle: Text(
          '\$19.00',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: const Color(0xffFAFAFA)),
        ),
        trailing: SizedBox(
          width: 150,
          child: TextButton(
            style: ButtonStyle(
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Color(0xffFFFFFF), width: 1)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddToCart()));
            },
            child: Text('Add to Cart',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.45,
                    color: const Color(0xffFFFFFF))),
          ),
        ),
      ),
    );
  }
}
