// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_screen.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
              ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HomeDetailScreen(
                          catalog: catalog,
                        ),
                  ),
                );
              },
              child: CatalogItem(catalog: catalog),
            );
          },
          itemCount: CatalogModel.items.length,
        )
        : ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HomeDetailScreen(
                          catalog: catalog,
                        ),
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
    var children = [
      SizedBox(width: 10),
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.xl
                .color(context.theme.colorScheme.secondary)
                .bold
                .make(),
            catalog.desc.text
                .textStyle(context.captionStyle)
                .make(),
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,

              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                AddToCart(catalog: catalog).pOnly(right: 8),
              ],
            ),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
          child:
              context.isMobile
                  ? Row(children: children)
                  : Column(children: children),
        )
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}
