import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/models/api_model.dart';
import 'package:shop_sharrie/screens/cart/cart_screen.dart';
import '../screens/product_description_screen.dart';

class DummyItemCard extends StatelessWidget {
  const DummyItemCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    String getImageUrl(String? urLink) {
      String? urL =
          'https://api.timbu.cloud/images/$urLink?organization_id=b3cc8c67fa7049909c9b38033787792b&reverse_sort=false&page=1&size=25&Appid=97W459JCOYHKQF6&Apikey=9713371a82c24374ab53094e6d7057cc20240713153049998114';
      return urL;
    }

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
                        builder: (context) => ProductDescriptionScreen(
                              product: product,
                            )));
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(getImageUrl(
                            product.photos!.isNotEmpty
                                ? product.photos!.first.url
                                : '')),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
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
