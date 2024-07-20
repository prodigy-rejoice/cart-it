import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/empty_cart.dart';
import 'package:shop_sharrie/screens/home/home_screen.dart';
import 'package:shop_sharrie/utils/delivery_drop_down.dart';
import '../models/api_model.dart';
import '../utils/add_product_to_cart_tile.dart';
import '../utils/product_description_card.dart';
import '../utils/product_drop_down.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    String getImageUrl(String? urLink) {
      String? urL =
          'https://api.timbu.cloud/images/$urLink?organization_id=b3cc8c67fa7049909c9b38033787792b&reverse_sort=false&page=1&size=25&Appid=97W459JCOYHKQF6&Apikey=9713371a82c24374ab53094e6d7057cc20240713153049998114';
      return urL;
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          ListView(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                  child: ProjectDescriptionCard(
                    image: getImageUrl(product.photos!.isNotEmpty
                        ? product.photos![0].url
                        : ''),
                  )),

              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.uniqueId}',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff6E6E6E)),
                    ),
                    Text(
                      'In Stock',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xff408C2B)),
                    )
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    const Gap(20),
                    Text(
                      '${product.description}',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff5A5A5A),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    const Gap(15),
                    Text(
                      'Made with pure natural ingredients',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color(0xff4EAB35)),
                    ),
                    const Gap(30),
                    const ProductDropDownButton(
                        title: 'How to use ',
                        content:
                            'Apply a generous amount to damp skin, massage in circular motions, and rinse thoroughly. \n \nUse 2-3 times a week for best results.'),
                    const Divider(),
                    const Gap(10),
                    const DeliveryDropOff(),
                    const Divider(),
                    const Gap(5),
                  ],
                ),
              ),
              AddProductToCart(
                product: product,
              ),
              // const CheckOutProduct(),
            ],
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffFFFFFF),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 8,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmptyCart()));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                )),
          ),
        ],
      ),
    );
  }
}
