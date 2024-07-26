import 'dart:math';

import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Products product;
  const ProductTile({super.key, required this.product});

  // method --
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[300],
        title: Text("Want to add in Cart?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              // 1 way of adding --
              //Provider.of<Shop>(context).addtoUserCart(widget.product);
              // another way --
              context.read<Shop>().addtoUserCart(product);
            },
            child: Text("Add"),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[400],
      ),
      width: 260,
      // height: 100,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(30),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image --
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  child: Image.asset(product.imagePath),
                  color: Colors.grey[200],
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // name --
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              // description
              Text(
                product.description,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // price && add to cart --
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + product.price.toString()),
              GestureDetector(
                onTap: () => addToCart(context),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                ),
              )
            ],
          ),
          //MaterialButton(onPressed: onPressed)
        ],
      ),
    );
  }
}
