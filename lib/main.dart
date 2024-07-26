import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/pages/cartPage.dart';
import 'package:ecommerce_app/pages/homePage.dart';
import 'package:ecommerce_app/pages/introPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        "/intro": (context) => IntroPage(),
        "/home": (context) => HomePage(),
        "/cart": (context) => CartPage(),
      },
    );
  }
}
