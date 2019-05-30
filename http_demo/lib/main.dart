import 'dart:convert';

import 'package:flutter/material.dart';

import 'apis/api.dart';
import 'models/todo.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Http Test",
      debugShowCheckedModeBanner: false,
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListAppState();
}

class TodoListAppState extends State {
  List<Todo> list = new List<Todo>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,position){
          return ListTile(title: Text(list[position].title),);
        },
      ),
    );
  }

  getTodos() {
    Api.getTodos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list = list.map((model) => Todo.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }
}
