import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/cart/cart_screen.dart';
import 'package:stacked/stacked.dart';

import '../models/api_model.dart';
import '../screens/cart/cart_view_model.dart';

class CheckOutProduct extends StackedView<CartViewModel> {
  const CheckOutProduct(
    this.product, {
    super.key,
    required this.color,
    required this.title,
    required this.price,
  });
  final int color;
  final String title;
  final String price;
  final Product product;

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Color(color),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        leading: TextButton(
          style: ButtonStyle(
              side: const MaterialStatePropertyAll(
                  BorderSide(color: Color(0xff363939), width: 1)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor:
                  const MaterialStatePropertyAll(Colors.transparent)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xff363939))),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff797A7B)),
            ),
            Text(
              price,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: const Color(0xff363939)),
            ),
          ],
        ),
        trailing: TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xff408C2B))),
          onPressed: () {
            viewModel.addToCart(product);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          child: Text('Checkout',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color(0xffFFFFFF))),
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) {
    return CartViewModel();
  }
}
