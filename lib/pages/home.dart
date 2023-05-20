import 'package:flutter/material.dart';

import '../utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoList = [
    ['Flutter', false],
    ['iOS', false]
  ];

  void checkState(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text('TO DO'),
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: todoList[index][0],
                isTaskCompleted: todoList[index][1],
                onchanged: (value) => checkState(value, index));
          },
        ));
  }
}
