import 'package:flutapp/models/catalog.dart';
import 'package:flutapp/widgets/add_to_cart.dart';
import 'package:flutapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\Rs. ${catalog.price}".text.bold.xl2.red800.make(),
              AddToCart(catalog: catalog).wh(120, 40)
            ],
          ).p32(),
        ),
        body: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl2
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.manufacturer.text.medium.make(),
                    8.heightBox,
                    Row(
                      children: [
                        "Composition : ".text.bold.make(),
                        catalog.composition.text.make(),
                      ],
                    ).px16(),
                    5.heightBox,
                    catalog.desc.text.make().px16()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
