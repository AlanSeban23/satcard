import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satcard/Models/shop.dart';
import 'package:satcard/components/My_Drawer.dart';
import 'package:satcard/components/My_Product_tile.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Satcard'),
        centerTitle: true,
        actions: [
          // go to cart page
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),

          // shop subtitle
          Center(
            child: Text(
              "Select from our premium products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          //product list

          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get individual products from shop
                  final p1 = products[index];

                  //return as a product tule ui

                  return MyProductTile(p1: p1);
                }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton(
          onPressed: () {
            // Define the action for the button, e.g., navigating to another page
            Navigator.pushNamed(context, '/model');
            // CameraScreen();
          },
          child: const Icon(
            Icons.camera_alt_rounded,
            color: Colors.black,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
