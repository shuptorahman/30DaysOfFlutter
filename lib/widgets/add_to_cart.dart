import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(
      context,
      on: [AddMutation, RemoveMutation],
    );

    final CartModel? cart = (VxState.store as MyStore).cart;

    bool isInCart = cart!.items.contains(catalog);
    return ElevatedButton(
      //add to cart button
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          context.theme.colorScheme.secondary,
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
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
