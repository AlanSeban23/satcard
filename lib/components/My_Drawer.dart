
import 'package:flutter/material.dart';
import 'package:satcard/components/MyList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // drawer header
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //shop tile
              MyListTile(
                  text: "Shop",
                  //onTap: () => Navigator.pop(context),
                  onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/shop_page');
                },
                  icon: Icons.home),
              MyListTile(
                text: "Cart",
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/cart_page');
                },
                icon: Icons.shopping_cart,
              ),
              // MyListTile(
              //   text: "Exit",
              //   onTap: () {},
              //   icon: Icons.logout,
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: MyListTile(
              text: "Exit",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
              icon: Icons.logout,
            ),
          ),

          //cart TileMode

          // exit shop tile
        ],
      ),
    );
  }
}
