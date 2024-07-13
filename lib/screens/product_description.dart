import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/empty_cart.dart';
import 'package:shop_sharrie/screens/home_screen.dart';
import '../utils/add_product_to_cart_tile.dart';
import '../utils/product_description_card.dart';
import '../utils/product_drop_down.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          ListView(
            children: [
              const AspectRatio(
                  aspectRatio: 1,
                  child: ProjectDescriptionCard(
                    image: 'assets/Repair scrub container (1).png',
                  )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProjectDescriptionCard(
                    image: 'assets/Repair scrub container (2).png',
                  ),
                  ProjectDescriptionCard(
                    image: 'assets/Carousel card (2).png',
                  ),
                ],
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'RS34670',
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
                      'Repair Scrub',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                    const Gap(20),
                    Text(
                      'Our Repair Body Scrub is expertly crafted to rejuvenate and revitalize your skin. This luxurious scrub combines natural exfoliants with nourishing ingredients to gently remove dead skin cells, promote cell renewal, and restore your skin\'s natural radiance.',
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
                    const ProductDropDownButton(title: 'How to use '),
                    const Divider(),
                    const Gap(10),
                    const ProductDropDownButton(title: 'Delivery and drop-off'),
                    const Divider(),
                    const Gap(5),
                  ],
                ),
              ),
              const AddProductToCart(),
              // const CheckOutProduct(),
            ],
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
