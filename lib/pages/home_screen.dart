import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/myroutes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final url =
      "https://api.jsonbin.io/v3/b/6810f8518561e97a500a2680";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString(
    //   "assets/files/catalog.json",
    // );
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    var decodeData = jsonDecode(catalogJson);

    var productData = decodeData["record"]["products"];

    CatalogModel.items =
        List.from(
          productData,
        ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder:
            (ctx, _, __) => FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor:
                  context
                      .theme
                      .floatingActionButtonTheme
                      .backgroundColor,
              foregroundColor:
                  context
                      .theme
                      .floatingActionButtonTheme
                      .foregroundColor,
              onPressed:
                  () => Navigator.pushNamed(
                    context,
                    MyRoutes.cartRoutes,
                  ),
              child: Icon(CupertinoIcons.cart),
            ).badge(
              color: Vx.amber700,
              size: 20,
              count: cart?.items.length,
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator()
                    .centered()
                    .py16()
                    .expand(),
            ],
          ),
        ),
      ),
    );
  }
}
