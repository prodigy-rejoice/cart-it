import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/home_screen.dart';
import 'package:shop_sharrie/utils/shop_item_card.dart';

import '../utils/dummy_shop_item.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.shopping_cart_outlined,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('assets/remove_shopping_cart.png'),
                  height: 60),
              const Gap(20),
              Text('Your Cart is empty',
                  style: GoogleFonts.lora(
                      fontWeight: FontWeight.w600, fontSize: 18)),
              const Gap(10),
              Text(
                'Explore our collections today and start your journey \ntowards radiant beauty. Your skin will thank you',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color(0xff818181)),
              ),
              const Gap(20),
              TextButton(
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('Start shopping',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xffFFFFFF))),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently viewed',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff0A0B0A),
                        letterSpacing: 2),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xff408C2B)),
                  ),
                ],
              ),
              const Divider(),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Flexible(child: DummyItemCard())),
            ],
          ),
        ),
      ),
    );
  }
}
