// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailScreen extends StatelessWidget {
  final Item catalog;
  const HomeDetailScreen({Key? key, required this.catalog})
    : super(key: key);

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
                  child: "Buy".text.xl3.white.make(),
                ).pOnly(right: 8),
              ],
            ).py32(),
      ),
      appBar: AppBar(),
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
