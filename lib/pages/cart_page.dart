import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4
              .color(context.theme.colorScheme.secondary)
              .make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                context
                    .theme
                    .floatingActionButtonTheme
                    .backgroundColor,
              ),
              foregroundColor: WidgetStatePropertyAll(
                context
                    .theme
                    .floatingActionButtonTheme
                    .foregroundColor,
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      "Buying not supported yet!".text
                          .make(),
                ),
              );
            },
            child: "Buy".text.xl4.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
          itemCount: _cart.items.length,
          itemBuilder:
              (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text.make(),
              ),
        );
  }
}
