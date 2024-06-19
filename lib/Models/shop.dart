
import 'package:flutter/material.dart';
import 'package:satcard/Models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<product> _shop = [
    product(
        name: "product 1 ",
        price: 99.00,
        description: "item description ",
        imagepath: 'assets/logo.png'),
    product(
      name: "product 2",
      price: 99.00,
      description: "item description",
      imagepath: 'assets/logo.png',
    ),
    product(
      name: "product 3",
      price: 99.00,
      description: "item description",
      imagepath: 'assets/logo.png',
    ),
    product(
      name: "product 4",
      price: 99.00,
      description: "item description",
      imagepath: 'assets/logo.png',
    ),
  ];

  //user cart
  List<product> _cart = [];

  //get product list
  List<product> get shop => _shop;

  //get user cart

  List<product> get cart => _cart;

  //add item to cart

  void addToCart(product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove from cart

  void removeFromCart(product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
