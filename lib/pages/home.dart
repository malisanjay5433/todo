import 'package:flutter/material.dart';

import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  List todoList = [
    ['Flutter', false],
    ['iOS', false]
  ];

  void checkState(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void dimiss() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: dimiss,
          );
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
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
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
