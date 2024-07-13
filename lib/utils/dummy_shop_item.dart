import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/cart.dart';
import '../screens/product_description.dart';

class DummyItemCard extends StatelessWidget {
  const DummyItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Card(
        elevation: 0,
        color: const Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDescription()));
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/Repair scrub container (2).png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'Repair Scrub',
                style: GoogleFonts.poppins(
                    fontSize: 9.7,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff797A7B)),
              ),
              subtitle: Text(
                '\$ 19.00',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xff363939)),
              ),
              trailing: TextButton(
                style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Color(0xff408C2B), width: 1)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    elevation: const MaterialStatePropertyAll(0),
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xffFFFFFF))),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: Text('Add to Cart',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 7,
                        color: const Color(0xff408C2B))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
