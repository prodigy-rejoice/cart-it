import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/screens/product_details/product_details_screen.dart';
import '../models/api_model.dart';
import '../screens/product_description_screen.dart';

class ShopItemCard extends StatelessWidget {
  const ShopItemCard({
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

    String price = '';
    if (product.currentPrice != null && product.currentPrice!.isNotEmpty) {
      var usdPrices = product.currentPrice![0].USD;
      if (usdPrices != null && usdPrices.isNotEmpty) {
        price = usdPrices[0].toString();
      }
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
                  child: CachedNetworkImage(
                    imageUrl: getImageUrl(product.photos!.isNotEmpty
                        ? product.photos![0].url
                        : ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  product.name ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 9.7,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff797A7B)),
                ),
                subtitle: Text(
                  '\$ $price',
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
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product)));
                  },
                  child: Text('Add to Cart',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 7,
                          color: const Color(0xff408C2B))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
