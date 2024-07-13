import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/cart.dart';
import 'package:shop_sharrie/screens/product_description.dart';
import 'package:shop_sharrie/utils/cart_button.dart';
import 'package:shop_sharrie/utils/checkout_product.dart';
import 'package:shop_sharrie/utils/product_quantity.dart';
import '../utils/product_description_card.dart';
import '../utils/product_drop_down.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

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
              Gap(10),
              Container(
                height: 40,
                width: 50,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: IconButton(
                        icon:
                            const Icon(Icons.remove, color: Color(0xff408C2B)),
                        onPressed: _decrementCount,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                            horizontal: BorderSide(color: Colors.grey)),
                      ),
                      child: Center(
                        child: Text(
                          '$_count',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Color(0xff408C2B)),
                        onPressed: _incrementCount,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              const CheckOutProduct(color: 0xffE4F5E0, title: 'Unit Price', price: '\$19.00'),
            ],
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDescription()));
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
          CartButtonWithCount(
            count: _count,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
    );
  }
}
