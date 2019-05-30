import 'package:ecommerce/Screens/productDetail.dart';
import 'package:ecommerce/Utilities/Constants.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) => ProductDetail()
  };
}
