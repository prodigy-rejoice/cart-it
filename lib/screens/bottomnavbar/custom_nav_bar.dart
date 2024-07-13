import 'package:flutter/material.dart';
import 'package:shop_sharrie/screens/bottomnavbar/bottom_nav_items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        enableFeedback: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        onTap: (int index) {
          index = currentIndex;
        },
        elevation: 6,
        backgroundColor: const Color(0xffFFFFFF),
        currentIndex: currentIndex,
        items: bottomNavigationBarItem,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 20),
        unselectedIconTheme: const IconThemeData(size: 20),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
