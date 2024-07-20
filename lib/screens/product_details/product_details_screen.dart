import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_sharrie/models/api_model.dart';
import 'package:shop_sharrie/screens/cart/cart_screen.dart';
import 'package:shop_sharrie/screens/product_description_screen.dart';
import 'package:shop_sharrie/screens/product_details/product_details_viewmodel.dart';
import 'package:shop_sharrie/utils/cart_button.dart';
import 'package:shop_sharrie/utils/checkout_product.dart';
import 'package:shop_sharrie/utils/delivery_drop_down.dart';
import 'package:stacked/stacked.dart';
import '../../utils/product_description_card.dart';
import '../../utils/product_drop_down.dart';

class ProductDetailsScreen extends StackedView<ProductDetailsViewModel> {
  final Product product;
  String getImageUrl(String? urLink) {
    String? urL =
        'https://api.timbu.cloud/images/$urLink?organization_id=b3cc8c67fa7049909c9b38033787792b&reverse_sort=false&page=1&size=25&Appid=97W459JCOYHKQF6&Apikey=9713371a82c24374ab53094e6d7057cc20240713153049998114';
    return urL;
  }

  const ProductDetailsScreen({super.key, required this.product});

  @override
  ProductDetailsViewModel viewModelBuilder(BuildContext context) {
    return ProductDetailsViewModel(product);
  }

  @override
  Widget builder(
      BuildContext context, ProductDetailsViewModel viewModel, Widget? child) {
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
                    DeliveryDropOff(),
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
                        onPressed: () => viewModel.decrement(),
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
                          '${viewModel.count}',
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
                        onPressed: () => viewModel.increment(),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              CheckOutProduct(product,
                  color: 0xffE4F5E0,
                  title: 'Unit Price',
                  price: '\$${viewModel.price}'),
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
                        builder: (context) => ProductDescriptionScreen(
                              product: product,
                            )));
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
            count: viewModel.count,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
          )
        ],
      ),
    );
  }
}
