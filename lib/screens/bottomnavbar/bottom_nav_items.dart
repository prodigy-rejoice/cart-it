import 'package:flutter/material.dart';

final List<BottomNavigationBarItem> bottomNavigationBarItem = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      label: 'Home'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      activeIcon: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      label: 'Wishlist'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_outlined),
      activeIcon: Icon(
        Icons.person_outlined,
        color: Colors.black,
      ),
      label: 'Profile'),
  const BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(
        Icons.search_outlined,
        color: Colors.black,
      ),
      label: 'Search')
];
