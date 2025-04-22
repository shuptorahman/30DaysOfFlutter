// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailScreen extends StatelessWidget {
  final Item catalog;
  const HomeDetailScreen({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child:
            OverflowBar(
              alignment: MainAxisAlignment.spaceBetween,

              children: [
                "\$${catalog.price}".text.xl3.red800.bold
                    .make()
                    .px8(),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      MyTheme.darkBlueishColor,
                    ),
                  ),
                  onPressed: () {},
                  child:
                      "Add to cart".text.xl3.white.make(),
                ).pOnly(right: 8),
              ],
            ).py32(),
      ),
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child:
                      Column(
                        children: [
                          catalog.name.text.xl4
                              .color(
                                MyTheme.darkBlueishColor,
                              )
                              .bold
                              .make(),
                          catalog.desc.text.xl
                              .textStyle(
                                context.captionStyle,
                              )
                              .make(),
                          "Voluptua clita vero sed takimata ea nonumy, sit amet erat amet duo aliquyam dolores sadipscing, takimata ipsum no sed erat ipsum. Ipsum diam ipsum accusam invidunt dolore at, ipsum sadipscing ipsum sed sit justo et. Gubergren aliquyam voluptua nonumy ipsum elitr amet eos rebum gubergren. Rebum sadipscing nonumy accusam vero."
                              .text
                              .textStyle(
                                context.captionStyle,
                              )
                              .make()
                              .p16(),
                        ],
                      ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
