import 'package:etrade/db/dbHelper.dart';
import 'package:etrade/models/product.dart';
import 'package:flutter/material.dart';


class ProductUpdate extends StatefulWidget {
  Product product;

  ProductUpdate(this.product);
  @override
  State<StatefulWidget> createState() => ProductUpdateState(product);
}

class ProductUpdateState extends State {
  Product product;

  ProductUpdateState(this.product);
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtDescription = new TextEditingController();
  TextEditingController txtPrice = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product : ${product.name}"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Text(product.name),
                Text(product.description),
                Text(product.price.toString()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(labelText: "Name"),
                  textCapitalization: TextCapitalization.words,
                  autofocus: true,
                ),
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(labelText: "Description"),
                  textCapitalization: TextCapitalization.words,
                ),
                TextField(
                  controller: txtPrice,
                  decoration: InputDecoration(labelText: "Price"),
                ),
                FlatButton(
                  child: Text("Update"),
                  onPressed: () {
                    update();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void update() async {
    DbHelper dbHelper = new DbHelper();

    int result = await dbHelper.update(Product.withId(product.id, txtName.text,
        txtDescription.text, double.tryParse(txtPrice.text)));

    if (result != 0) {
      Navigator.pop(context, true);
    }
  }
}
