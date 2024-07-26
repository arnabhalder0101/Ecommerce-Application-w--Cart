import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // product for sale --
  List<Products> items = [
    Products(
        name: "Smart Watch",
        price: 150.89,
        description:
            "Best smartwatch in the market, with a lot of handsful features, navigation becames easier with this",
        imagePath: "lib/assets/watch.png"),
    Products(
        name: "Smart Watch",
        price: 150.99,
        description:
            "Best smartwatch in the market, with a lot of handsful features, navigation becames easier with this",
        imagePath: "lib/assets/watch2.png"),
    Products(
        name: "Analog Watch",
        price: 130.99,
        description:
            "Feel the vintage feelings with this, Modern design that will steal your attention",
        imagePath: "lib/assets/watch3.png"),
    Products(
        name: "Vision Pro Sunglasses",
        price: 49.99,
        description:
            "Lets see the world with the eyes of a pro and feel the good feeling",
        imagePath: "lib/assets/sunglasses.png"),
    Products(
        name: "Asus Laptop",
        price: 399.99,
        description:
            "CPU: Intel i5 12th Gen, HD Monitor, Inbuild Grafix Card, 500 GB SSD",
        imagePath: "lib/assets/laptop.png"),
    Products(
        name: "Desktop Pro",
        price: 499.99,
        description:
            "CPU: Intel i5 12th Gen, HD Monitor, Inbuild Grafix Card, 500 GB SSD + 1 TB HDD, Keyboard, Mouse inside",
        imagePath: "lib/assets/desktop.png"),
    Products(
        name: "Phone Stand",
        price: 19.99,
        description:
            "Worry not let it hold your phone, Assured quality from us",
        imagePath: "lib/assets/stand.png"),
  ];

  // user cart --
  List<Products> userCart = [];

  // getters --

  List<Products> get getProduct => items;
  List<Products> get getUserCart => userCart;

  // adding item to the cart --
  void addtoUserCart(Products item) {
    userCart.add(item);
    notifyListeners();
  }

  // removing item from the cart --
  void removeFromUserCart(Products item) {
    userCart.remove(item);
    notifyListeners();
  }
}
