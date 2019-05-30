import 'package:etrade/db/dbHelper.dart';
import 'package:etrade/models/product.dart';
import 'package:etrade/screens/productUpdate.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  Product product;

  ProductDetail(this.product);

  @override
  State<StatefulWidget> createState() => ProductDetailState(product);
}

DbHelper dbHelper = new DbHelper();
enum Choice { Delete, Update }

class ProductDetailState extends State {
  Product product;

  ProductDetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail for ${product.name}"),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: select,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                  PopupMenuItem<Choice>(
                    value: Choice.Delete,
                    child: Text("Delete Product : ${product.name}"),
                  ),
                  PopupMenuItem<Choice>(
                    value: Choice.Update,
                    child: Text("Update  Product : ${product.name}"),
                  )
                ],
          )
        ],
      ),
      body: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shop),
                title: Text(product.name),
                subtitle: Text(product.description),
              ),
              Text("${product.name} price is ${product.price}"),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("Add To Cart"),
                      onPressed: () {
                        AlertDialog alertDialog = new AlertDialog(
                          title: Text("Add To Cart"),
                          content: Text("${product.name} Added to cart"),
                        );
                        showDialog(
                            context: context, builder: (_) => alertDialog);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void select(Choice choice) async {
    int result = 0;
    switch (choice) {
      case Choice.Delete:
        Navigator.pop(context, true);
        result = await dbHelper.delete(product.id);
        if (result != 0) {
          AlertDialog alertDialog = new AlertDialog(
            title: Text("Success!!"),
            content: Text("${product.name} Deleted!!!"),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      case Choice.Update:
        var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductUpdate(product)));
        if(result != null) if(result) Navigator.pop(context, true);
          // AlertDialog alertDialog = new AlertDialog(
          //   title: Text("Success!!"),
          //   content: Text("Product updated!!!"),
          // );
          // showDialog(context: context, builder: (_) => alertDialog);
       
        break;
    }
  }
}
