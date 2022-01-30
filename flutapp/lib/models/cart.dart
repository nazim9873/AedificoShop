import 'package:flutapp/core/store.dart';
import 'package:flutapp/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // singelton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  CatalogModel _catalog = CatalogModel(); //catalog field
  final List<int> _itemIds = []; // collection of IDs

  // get catalog
  CatalogModel get catalog => _catalog;

  set Catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items to the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + double.parse(current.price));
}

// Add Action
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
