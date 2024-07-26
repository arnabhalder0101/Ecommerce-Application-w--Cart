import 'package:ecommerce_app/components/button.dart';
import 'package:ecommerce_app/components/cartTile.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  void goBack(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[300],
        content: Text("Your Cart is Empty"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/home");
            },
            child: Text("Go to Shop"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void Function()? payNow(BuildContext context) {
    final cart = context.read<Shop>().getUserCart;
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].price;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[300],
        title: Text("Want to Pay? "),
        content: Text("Total Amount \$${total}"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              print("Paid");
              Fluttertoast.showToast(msg: "Thanks for Shopping with us!");
            },
            child: Text("YES"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/home");
            },
            child: Text("SHOP MORE"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().getUserCart;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        title: Text("Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your Cart is Empty"))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart[index];
                        return CartTile(product: product);
                      },
                    ),
            ),
            // pay button --
            MyButton(
                child: const Text("PAY NOW"),
                color: Colors.white,
                onTap: () => cart.isEmpty ? goBack(context) : payNow(context)),
          ],
        ),
      ),
    );
  }
}
