// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:satcard/components/My_Button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            // Icon(
            //   Icons.shopping_bag,
            //   size: 72,
            //   color: Theme.of(context).colorScheme.inversePrimary,
            // ),
            Image.asset(
              "assets/logo.png",
              height: 300,
              width: 300,
            ),

            const SizedBox(
              height: 25,
            ),

            //title

            Text(
              "Satcard",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //subtitle
            Text(
              'Efficient agri-tech solutions.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            // button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
