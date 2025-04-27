import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_screen.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

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
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(
                                  context
                                      .theme
                                      .colorScheme
                                      .secondary,
                                ),
                          ),
                          onPressed: () {},
                          child:
                              "Add to cart".text.white
                                  .make(),
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
