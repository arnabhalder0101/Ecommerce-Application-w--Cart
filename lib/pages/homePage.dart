import 'package:ecommerce_app/components/buttomNavigation.dart';
import 'package:ecommerce_app/components/drawer.dart';
import 'package:ecommerce_app/components/productTile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        title: Text("Shop Page"),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
              
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart_checkout_rounded),
          ),
          // IconButton(
          //   onPressed: () {
          //     // Navigator.pop(context);
          //     Navigator.pushNamed(context, "/intro");
          //   },
          //   icon: Icon(Icons.exit_to_app_rounded),
          // ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      drawer: AppDrawer(),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        children: [
          // text --
          Center(
            child: Text(
              "Pick from the choices below",
              style: TextStyle(fontSize: 17),
            ),
          ),

          SizedBox(
            height: 570,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                }),
          ),

          // MyBottomNavigation(),
        ],
      ),
      // Bottom navigationBar -
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
