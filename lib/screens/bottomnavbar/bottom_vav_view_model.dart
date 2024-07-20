import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../home/home_screen.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    HomeScreen(),
  ];

  Widget get currentScreen => _screens[_currentIndex];

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
