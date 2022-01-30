import 'package:flutapp/core/store.dart';
import 'package:flutapp/models/cart.dart';
import 'package:flutapp/models/catalog.dart';
import 'package:flutapp/products.dart';
import 'package:flutapp/utils/routes.dart';
import 'package:flutapp/widgets/catalog_header.dart';
import 'package:flutapp/widgets/catalog_list.dart';
import 'package:flutapp/widgets/drawer.dart';
import 'package:flutapp/widgets/item_widgets.dart';
import 'package:flutapp/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  final url = "http://127.0.0.1:8000/prolist/";
  loadData() async {
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json") == null
    //         ? "Null"
    //         : await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    var catalogJson = response.body;
    if (response.statusCode == 200) {
      print(catalogJson);
      var productsData = jsonDecode(catalogJson.toString());
      CatalogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
            mutations: {AddMutation, RemoveMutation},
            builder: (context, _, status) {
              return FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                backgroundColor: MyTheme.darkBluishColor,
                child: Icon(CupertinoIcons.cart, color: Colors.white),
              ).badge(
                  color: Vx.coolGray200,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold));
            }),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16().expand()
                  else
                    CircularProgressIndicator().centered().expand()
                ],
              )),
        ),
        drawer: MyDrawer());
  }
}
