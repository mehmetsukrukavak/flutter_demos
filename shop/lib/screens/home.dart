import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.topLeft,
          // margin: EdgeInsets.all(50.0),
          padding: EdgeInsets.only(top: 50.0),
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    "Dell G3 Laptop",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "i7 CPU, 16 GB Ram, 256 GB SSD",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    "Dell Laptop",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "i5 CPU, 8 GB Ram, 128 GB SSD",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              ),
              Directionality(
                child: OrderButton(),
                textDirection: TextDirection.ltr,
              )
            ],
          )),
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: RaisedButton(
        onPressed: () {
          order(context);
        },
        elevation: 5.0,
        child: Text("Go To Checkout"),
      ),
    );

    return button;
  }
}

order(BuildContext context) {
  var alert = AlertDialog(
    title: Text("Go To Checkout"),
    content: Text("I'll Go To Checkout"),
  );

  showDialog(context: context, builder: (BuildContext context) => alert);
}
