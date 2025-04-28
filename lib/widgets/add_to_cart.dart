import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
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
          _cart.add(widget.catalog);

          setState(() {});
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
