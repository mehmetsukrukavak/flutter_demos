import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentDialogBoxState();
  }
}

class StudentDialogBoxState extends State<MyHomePage> {
  var cities = ["Ankara", "İstanbul", "İzmir", "Van"];
  var selectedCity = "Ankara";
  String studentName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student App"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (String nameToChange) {
              setState(() {
                studentName = nameToChange;
              });
            },
          ),
          Text("Hello : " + studentName),
          DropdownButton<String>(
            items: cities.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            value: selectedCity,
            onChanged: (String value) {
              setState(() {
                selectedCity = value;
              });
            },
          ),
          Text("Seçilen Şehir : "+ selectedCity)
        ],
      ),
    );
  }
}
