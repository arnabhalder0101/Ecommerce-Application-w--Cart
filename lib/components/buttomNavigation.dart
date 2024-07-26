import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavigation extends StatelessWidget {
  MyBottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: GNav(
          activeColor: Colors.grey.shade800,
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 30,
          gap: 10,
          tabMargin: EdgeInsets.symmetric(vertical: 10),
          tabs: [
            GButton(
              icon: Icons.home_rounded,
              text: "Home",
              onPressed: () {},
            ),
            GButton(
              icon: Icons.shopping_cart_checkout_rounded,
              text: "Cart",
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushNamed(context, "/cart");
              },
            ),
            // GButton(
            //   icon: Icons.exit_to_app,
            //   text: "Exit",
            //   onPressed: () {
            //     Navigator.pushNamed(context, "/intro");
            //   },
            // ),
          ]),
    );
  }
}
