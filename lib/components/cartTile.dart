import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartTile extends StatelessWidget {
  Products product;
  CartTile({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // watch Provider --
    final cart = context.watch<Shop>();

    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: ListTile(
        tileColor: Colors.grey[200],
        // image --
        leading: Image.asset(product.imagePath),
        // name--
        title: Text(product.name),
        // price--
        subtitle: Text(product.price.toString()),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        trailing: GestureDetector(
          onTap: () {
            // Show alert - if confirmed then remove, else keep--
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.grey[300],
                // icon: Icon(
                //   Icons.warning_rounded,
                //   color: Colors.red[400],
                // ),
                title: Text(
                  "Alert!",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                content: Text(
                  "Want to remove from cart?",
                  style: TextStyle(fontSize: 16),
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        return cart.removeFromUserCart(product);
                      },
                      child: Text("Remove")),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                ],
              ),
            );
          },
          child: Icon(
            Icons.delete_outline_rounded,
          ),
        ),
      ),
    );
  }
}
