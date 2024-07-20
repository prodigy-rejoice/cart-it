import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/api_model.dart';

class WishListItem extends StatelessWidget {
  final Product product;
  final String image;
  final int count;
  final void Function() incrementCallback;
  final void Function() decrementCallback;
  final void Function() deleteItem;

  const WishListItem(
      {super.key,
      required this.incrementCallback,
      required this.decrementCallback,
      required this.product,
      required this.count,
      required this.image,
      required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 100,
              decoration: (BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              )),
            ),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Text(
                  product.uniqueId ?? 'RS34670',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff6E6E6E)),
                ),
                Text(
                  product.name ?? 'Product',
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
                            onPressed: decrementCallback,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(color: Colors.grey)),
                            ),
                            child: Center(
                              child: Text(
                                '$count',
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
                            onPressed: incrementCallback,
                          ),
                        ),
                      ],
                    ),
                    const Gap(7),
                    SizedBox(
                      width: 34,
                      height: 26,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xffCC474E)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder())),
                          onPressed: deleteItem,
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
                  '\$${product.currentPrice?.first.USD?.first.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
