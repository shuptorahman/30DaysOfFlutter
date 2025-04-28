import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      //add to cart button
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          context.theme.colorScheme.secondary,
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);

          // setState(() {});
        }
      },
      child:
          isInCart
              ? Icon(Icons.done, color: Colors.white)
              : Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ),
    );
  }
}
