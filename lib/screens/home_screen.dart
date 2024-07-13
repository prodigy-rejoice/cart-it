import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_sharrie/screens/bottomnavbar/custom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:shop_sharrie/screens/empty_cart.dart';
import 'package:shop_sharrie/utils/collection_card.dart';

import '../models/api_model.dart';
import '../utils/shop_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  static const String apiKey =
      '9713371a82c24374ab53094e6d7057cc20240713153049998114';
  static const String appId = '97W459JCOYHKQF6';
  static const String organizationId = 'b3cc8c67fa7049909c9b38033787792b';
  static const String baseUrl = "https://api.timbu.cloud/products";

  Future<void> fetchProducts() async {
    const url =
        '$baseUrl?organization_id=$organizationId&reverse_sort=false&page=1&size=25&Appid=$appId&Apikey=$apiKey';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;

        Map<String, dynamic> jsonData = json.decode(data);
        if (jsonData.containsKey('items')) {
          List<dynamic> productData = jsonData['items'];
          List<Product> fetchedProducts =
              productData.map((value) => Product.fromJson(value)).toList();
          setState(() {
            products = fetchedProducts;
          });
        } else {
          print('Unexpected JSON format: $jsonData');
        }
      } else {
        print('Failed to load products: ${response.statusCode}');
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: index),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Sharrie’s Signature',
            style: GoogleFonts.redressed(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: const Color(0xff408C2B)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmptyCart()));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xff433F3E),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const Gap(20),
          Text(
            'Welcome, Jane',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const Gap(15),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFFFF),
              hintText: 'Search',
              hintStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffB1B2B2)),
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: Color(0xffB1B2B2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Color(0xffD2D3D3))),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Color(0xffD2D3D3))),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Color(0xffD2D3D3))),
            ),
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Just for you',
                style:
                    GoogleFonts.lora(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.chevron_left, size: 17),
                  Icon(Icons.chevron_right, size: 17),
                ],
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ShopItemCard(
                  product: products[index],
                );
              },
              itemCount: products.length,
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deals',
                style:
                    GoogleFonts.lora(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                'View all',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xff797A7B)),
              ),
            ],
          ),
          const Divider(),
          const Gap(20),
          GridView.builder(
            padding: EdgeInsets.all(0),
            itemCount: products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              return ShopItemCard(
                product: products[index],
              );
            },
          ),
          Gap(30),
          Text(
            'Our Collections',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300, fontSize: 16, letterSpacing: 3),
          ),
          Divider(),
          Gap(15),
          GridView.builder(
            padding: EdgeInsets.all(0),
            itemCount: products.length > 4 ? 4 : products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              return CollectionCard(
                product: products[index],
              );
            },
          ),
          Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You might like',
                style:
                    GoogleFonts.lora(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                'View all',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color(0xff797A7B)),
              ),
            ],
          ),
          Divider(),
          Gap(15),
          GridView.builder(
            padding: EdgeInsets.all(0),
            itemCount: products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              return ShopItemCard(
                product: products[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
