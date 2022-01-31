import 'package:flutapp/core/store.dart';
import 'package:flutapp/pages/cart_page.dart';
import 'package:flutapp/pages/home_detail_page.dart';
import 'package:flutapp/pages/homepage.dart';
import 'package:flutapp/pages/loginpage.dart';
import 'package:flutapp/utils/routes.dart';
import 'package:flutapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
  // initialRoute: MyRoutes.homeRoute,
  // routes: {
  //   '/': (context) => LoginPage(),
  //   MyRoutes.homeRoute: (context) => HomePage(),
  //   MyRoutes.loginRoute: (context) => LoginPage(),
  //   MyRoutes.cartRoute: (context) => CartPage(),
}
