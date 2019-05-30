import 'package:flutter/material.dart';

import 'Screens/productList.dart';
import 'Utilities/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}
