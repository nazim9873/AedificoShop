import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  //Get element by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String use;
  final String manufacturer;
  final String composition;
  final String desc;
  final String price;
  final num category;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.use,
    required this.manufacturer,
    required this.composition,
    required this.desc,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        use: map['use'],
        manufacturer: map['manufacturer'],
        composition: map['composition'],
        desc: map['description'],
        price: map['price'],
        category: map['category'],
        image: map['image']);
  }
}
