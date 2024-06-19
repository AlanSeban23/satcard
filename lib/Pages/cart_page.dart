// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satcard/Models/product.dart';
import 'package:satcard/Models/shop.dart';
import 'package:satcard/components/My_Drawer.dart';

import '../components/My_Button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove from cart method
  void removeItemFromCart(BuildContext context, product p1) {
    //dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove this item from your cart'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              //add to cart
              context.read<Shop>().removeFromCart(p1);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  //user press Payment Button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay Connect With Your Upi App"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //access to cart page
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        //cart list
        Expanded(
          child: cart.isEmpty?
            Center(child: const Text("Your Cart Is Empty!!"),):
            ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final item = cart[index];
              //return as a cart title

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );
            },
          ),
        ),

        //payment button
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(
            onTap: () => payButtonPressed(context),
            child: Text('Pay Now'),
          ),
        )
      ]),
    );
  }
}
