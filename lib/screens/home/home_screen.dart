import 'package:flutter/material.dart';
import 'package:shop_sharrie/screens/bottomnavbar/custom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:shop_sharrie/screens/cart/cart_screen.dart';
import 'package:shop_sharrie/screens/home/home_view_model.dart';
import 'package:shop_sharrie/utils/collection_card.dart';
import 'package:stacked/stacked.dart';
import '../../utils/shop_item_card.dart';

class HomeScreen extends StackedView<HomeScreenViewModel> {
  HomeScreen({super.key});

  @override
  Widget builder(
      BuildContext context, HomeScreenViewModel viewModel, Widget? child) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.onTap,
      ),
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
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: const Icon(
                Icons.add_to_queue_outlined,
                color: Color(0xff433F3E),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body:
          // isLoading
          // ? Center(
          //     child: CircularProgressIndicator(),
          //   )
          // :
          ListView(
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
                itemCount: viewModel.productsCount,
                itemBuilder: (context, index) {
                  return ShopItemCard(
                    product: viewModel.products[index],
                  );
                }),
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
            itemCount: viewModel.productsCount,
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
                product: viewModel.products[index],
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
            itemCount: viewModel.productsCount,
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
                product: viewModel.products[index],
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
            itemCount: viewModel.productsCount,
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
                product: viewModel.products[index],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  HomeScreenViewModel viewModelBuilder(BuildContext context) {
    return HomeScreenViewModel();
  }
}
