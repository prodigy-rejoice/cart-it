import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/api_model.dart';
import '../screens/product_description.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({
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
                        builder: (context) => const ProductDescription()));
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
            Gap(7),
            Text(
              product.name ?? '',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
