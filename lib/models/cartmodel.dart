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
