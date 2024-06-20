import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:satcard/Models/shop.dart';

import 'package:satcard/Themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'package:satcard/Pages/model.dart';

import 'Pages/cart_page.dart';
import 'Pages/intro_page.dart';
import 'Pages/shop_page.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
        '/model': (context) => const CameraScreen(),
      },
    );
  }
}
