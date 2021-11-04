import 'package:catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // Catalog field
  late CatalogModel _catalog;

  // Collection of catalof id
  final List<int> _itemId = [];

  // Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item
  void addItem(Item item) {
    _itemId.add(item.id);
  }

  // Remove item
  void removeItem(Item item) {
    _itemId.remove(item.id);
  }
}
