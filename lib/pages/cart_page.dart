import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
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
  @override
  Widget build(BuildContext context) {
    final CartModel? cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, _, __) {
              return "\$${cart?.totalPrice}".text.xl4
                  .color(
                    context.theme.colorScheme.secondary,
                  )
                  .make();
            },
            mutations: {RemoveMutation},
          ),
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

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? cart = (VxState.store as MyStore).cart;
    return cart!.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
          itemCount: cart.items.length,
          itemBuilder:
              (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed:
                      () =>
                          RemoveMutation(cart.items[index]),

                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: cart.items[index].name.text.make(),
              ),
        );
  }
}
