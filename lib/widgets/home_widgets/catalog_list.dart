// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_screen.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        HomeDetailScreen(catalog: catalog),
              ),
            );
          },
          child: CatalogItem(catalog: catalog),
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
          child: Row(
            children: [
              SizedBox(width: 10),
              Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    catalog.name.text.xl
                        .color(
                          context
                              .theme
                              .colorScheme
                              .secondary,
                        )
                        .bold
                        .make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle)
                        .make(),
                    OverflowBar(
                      alignment:
                          MainAxisAlignment.spaceBetween,

                      children: [
                        "\$${catalog.price}".text.xl.bold
                            .make(),
                        _AddToCart(
                          catalog: catalog,
                        ).pOnly(right: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({required this.catalog});

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //add to cart button
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          context.theme.colorScheme.secondary,
        ),
      ),
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {});
      },
      child:
          isAdded
              ? Icon(Icons.done, color: Colors.white)
              : "Add to cart".text.white.make(),
    );
  }
}
