// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  //catalog
  CatalogModel? _catalogModel;

  //store IDs of each item.collection of IDs
  final List<int> _itemIds = [];
  //get catalog
  CatalogModel? get catalog => _catalogModel;

  //set catalog
  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalogModel = newCatalog;
  }

  //get items
  List<Item> get items =>
      _itemIds.map((id) => catalog!.getById(id)).toList();
  //get total price
  num get totalPrice => items.fold(
    0,
    (total, current) => total + current.price,
  );

  //add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.add(item.id);
  }
}
