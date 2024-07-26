import 'package:ecommerce_app/components/listTile.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_cart_rounded,
                  size: 40,
                ),
              ),
              ListTiles(
                title: Text("S h o p"),
                leading: Icon(Icons.shopping_bag_outlined),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTiles(
                title: Text("C a r t"),
                leading: Icon(Icons.shopping_cart_checkout),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/cart");
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ListTiles(
                  title: Text("E x i t"),
                  leading: Icon(Icons.exit_to_app_rounded),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/intro", (r) => false);
                    Navigator.pushNamed(context, "/intro");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
