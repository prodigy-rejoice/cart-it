import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/utils/dummy_shop_item.dart';
import 'package:shop_sharrie/utils/shop_item_card.dart';

import '../utils/checkout_product.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 90,
                  height: 100,
                  decoration: (BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image:
                            AssetImage('assets/Repair scrub container (1).png'),
                        fit: BoxFit.cover),
                  )),
                ),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    Text(
                      'RS34670',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff6E6E6E)),
                    ),
                    Text(
                      'Repair Scrub',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.remove,
                                    size: 12, color: Color(0xff408C2B)),
                                onPressed: _decrementCount,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  border: Border.symmetric(
                                      horizontal:
                                          BorderSide(color: Colors.grey)),
                                ),
                                child: Center(
                                  child: Text(
                                    '$_count',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.add,
                                    size: 12, color: Color(0xff408C2B)),
                                onPressed: _incrementCount,
                              ),
                            ),
                          ],
                        ),
                        const Gap(7),
                        Container(
                          width: 34,
                          height: 26,
                          child: TextButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xffCC474E)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder())),
                              onPressed: () {},
                              child: const Center(
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  color: Color(0xffFFFFFF),
                                  size: 12,
                                ),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Gap(7),
                    Text(
                      'Unit price',
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff6E6E6E)),
                    ),
                    const Gap(6),
                    Text(
                      '\$21.00',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const Gap(25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff408C2B)),
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(20),
                  Text(
                    'Cart summary',
                    style: GoogleFonts.lora(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Sub-total',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '\$19.00',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6E6E6E)),
                      ),
                    ],
                  ),
                  Gap(20),
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
                            color: Color(0xff6E6E6E)),
                      ),
                    ],
                  ),
                  Gap(30),
                  Divider(),
                  const CheckOutProduct(
                      color: 0xffFFFFFF, title: '', price: ''),
                ],
              ),
            ),
            Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You might like',
                  style: GoogleFonts.lora(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  'View all',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff797A7B)),
                )
              ],
            ),
            Divider(),
            Flexible(child: DummyItemCard()),
          ],
        ),
      ),
    );
  }
}
