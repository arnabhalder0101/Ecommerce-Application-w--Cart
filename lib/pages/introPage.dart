import 'package:ecommerce_app/components/button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_cart,
              size: 68,
              color: Colors.grey.shade800,
            ),

            SizedBox(
              height: 30,
            ),

            // title
            Text(
              "Shop App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // subtitile
            Text(
              "Quality Products Only",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            // button --
            MyButton(
              child: Icon(Icons.arrow_forward),
              color: Colors.white,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
