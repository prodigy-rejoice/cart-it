import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/cart/cart_view_model.dart';
import 'package:shop_sharrie/screens/checkout/checkout_screen.dart';
import 'package:shop_sharrie/utils/cart_item.dart';
import 'package:shop_sharrie/utils/dummy_shop_item.dart';
import 'package:stacked/stacked.dart';

import '../../models/api_model.dart';
import '../../utils/checkout_product.dart';

class CartScreen extends StackedView<CartViewModel> {
  const CartScreen({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    String getImageUrl(String? urLink) {
      String? urL =
          'https://api.timbu.cloud/images/$urLink?organization_id=b3cc8c67fa7049909c9b38033787792b&reverse_sort=false&page=1&size=25&Appid=97W459JCOYHKQF6&Apikey=9713371a82c24374ab53094e6d7057cc20240713153049998114';
      return urL;
    }

    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.2), child: Divider()),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Cart',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 16),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.cart.length,
                itemBuilder: (context, index) {
                  final product = viewModel.cart[index];
                  return CartItem(
                    incrementCallback: () => viewModel.increment(product),
                    decrementCallback: () => viewModel.decrement(product),
                    product: product,
                    count: viewModel.getCount(product),
                    image: getImageUrl(product.photos!.isNotEmpty
                        ? product.photos![0].url
                        : ''),
                    deleteItem: () => viewModel.deleteItem(product),
                  );
                },
              ),
              const Gap(25),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff408C2B)),
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(20),
                    Text(
                      'Cart summary',
                      style: GoogleFonts.lora(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sub-total',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ///TODO: Implement totalPrice
                          '\$${viewModel.totalPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff6E6E6E)),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Delivery',
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '\$2.00',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff6E6E6E)),
                        ),
                      ],
                    ),
                    const Gap(30),
                    const Divider(),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                              side: const MaterialStatePropertyAll(BorderSide(
                                  color: Color(0xff363939), width: 1)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(0),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: const Color(0xff363939))),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(0),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xff408C2B))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckOutScreen()));
                          },
                          child: Text('Checkout',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: const Color(0xffFFFFFF))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(25),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) {
    return CartViewModel();
  }
}
