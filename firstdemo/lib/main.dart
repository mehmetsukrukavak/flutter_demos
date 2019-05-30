import 'package:flutter/material.dart';

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My First App",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("My First Flutter App"),
          ),
          body: MainPage(),
        ));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          "Hello World!! , " + selamVer(),
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

String selamVer() {
  DateTime now = new DateTime.now();
  int hour = now.hour;

  if (hour <= 12) {
    return "Günaydın";
  } else {
    return "İyi Akşamlar";
  }
}
