import 'package:flutter/material.dart';
import 'package:shop_sharrie/app/app.locator.dart';
import 'package:shop_sharrie/screens/home/home_screen.dart';

void main() {
  setupLocator();
  runApp(
    const MyShoppingApp(),
  );
}

class MyShoppingApp extends StatelessWidget {
  const MyShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
